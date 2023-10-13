import QtQuick
import Felgo

AppPage {
  id: resultPage
  title: qsTr("Result")

  property string resultText: ""

  Column {
    width: parent.width
    anchors.centerIn: parent
    anchors.bottom: parent.bottom
    spacing: dp(10)

    AppText {
      text: "QR code:"
      fontSize: 18
      anchors.horizontalCenter: parent.horizontalCenter
    }

    AppTextField {
      id: resultTextField
      text: resultText
      font.pixelSize: sp(24)
      wrapMode: Text.WrapAnywhere
      width: parent.width
      leftPadding: dp(20)
      rightPadding: dp(20)
      horizontalAlignment: Text.AlignHCenter
      backgroundColor: "lightgrey"
      readOnly: true
    }

    AppButton {
      text: "Open url"
      visible: isUrl(resultText)
      iconLeft: IconType.externallink
      anchors.horizontalCenter: parent.horizontalCenter
      onClicked: {
        NativeUtils.openUrl(resultText)
      }
    }

    AppButton {
      id: copyButton
      text: "Copy"
      iconLeft: IconType.copy
      anchors.horizontalCenter: parent.horizontalCenter
      onClicked: {
        resultTextField.selectAll()
        resultTextField.copy()
      }
    }
  }

  function isUrl(str) {
    // Regular expression to check if the string is a valid URL
    const urlRegExp = /^(https?|ftp):\/\/[^\s\/$.?#].[^\s]*$/
    return urlRegExp.test(str)
  }
}
