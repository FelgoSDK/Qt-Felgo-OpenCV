import Felgo
import QtQuick
import QtMultimedia
import FelgoCV

AppPage {
  id: scannerPage
  title: qsTr("Scan Code")

  property string scanResultText: ""
  property bool parentStackVisible: scannerPage.navigationStack.visible

  signal codeDecoded(string qrCode)

  onScanResultTextChanged: {
    if(scanResultText !== "") {
      scannerPage.codeDecoded(scanResultText)
    }
  }

  onIsCurrentStackPageChanged: {
    // restart new scan when coming back from results page
    if(isCurrentStackPage) {
      scanResultText = ""
    }
  }

  Camera {
    id:camera
    active: parentStackVisible && isCurrentStackPage
  }

  CaptureSession {
    camera: camera
    videoOutput: videoOutput
  }

  VideoOutput {
    id: videoOutput
    anchors.fill: parent

    property double captureRectStartFactorX: 0.25
    property double captureRectStartFactorY: 0.25
    property double captureRectFactorWidth: 0.5
    property double captureRectFactorHeight: 0.5

    MouseArea {
      anchors.fill: parent
      onClicked: {
        camera.customFocusPoint = Qt.point(mouseX / width,  mouseY / height)
        camera.focusMode = Camera.FocusModeManual
      }
    }

    Rectangle {
      id: captureZone
      color: "#933015"
      opacity: 0.3
      width: parent.width * parent.captureRectFactorWidth
      height: parent.height * parent.captureRectFactorHeight
      x: parent.width * parent.captureRectStartFactorX
      y: parent.height * parent.captureRectStartFactorY
    }
  }

  OCVDecoder {
    id: ocvDecoder
    videoSink: videoOutput.videoSink
    onDecoded: function(message) {
      scanResultText = message
    }
  }
}
