import Felgo
import QtQuick

App {
  // You get free licenseKeys from https://felgo.com/licenseKey
  // With a licenseKey you can:
  //  * Publish your games & apps for the app stores
  //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
  //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
  //licenseKey: "<generate one from https://felgo.com/licenseKey>"

  screenWidth: 960
  screenHeight: 640

  NavigationStack {
    id: mainStack

    AppPage {
      title: qsTr("QR Scanner")

      Column {
        anchors.centerIn: parent
        AppButton {
          text: "Scan QR code"
          iconLeft: IconType.barcode
          flat: false
          onClicked: scannerModal.open()
          anchors.horizontalCenter: parent.horizontalCenter
        }
      }
    }
  }

  AppModal {
    id: scannerModal
    pushBackContent: mainStack

    onClosed: modalStack.popAllExceptFirst()

    NavigationStack {
      id: modalStack
      QrScannerPage {
        rightBarItem: TextButtonBarItem {
          text: qsTr("Close")
          textItem.font.pixelSize: sp(16)
          onClicked: scannerModal.close()
        }

        onCodeDecoded: function(message) {
          navigationStack.push(resultComponent, { resultText: message })
        }
      }
    }
  }

  Component {
    id: resultComponent
    ResultPage {
      id: resultPage
      rightBarItem: TextButtonBarItem {
        text: qsTr("Close")
        textItem.font.pixelSize: sp(16)
        onClicked: scannerModal.close()
      }
    }
  }
}
