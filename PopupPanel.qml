import QtQuick 2.0
import QtQuick.Controls 2.5



Popup {
    property alias popupX: popup.x
    property alias popupY: popup.y
    property alias popupWidth: popup.width
    property alias popupHeight: popup.height
    property alias sourceFile: pageLoader.source

    id: popup
    x: 100
    y: 100
    width: 300
    height: 300
    anchors.centerIn: parent
    modal: true
    focus: true
    padding:        0
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background: Rectangle {
      color: "transparent"   //背景为无色
   }
    Loader{
        id:pageLoader
        anchors.fill:parent
    }
}
