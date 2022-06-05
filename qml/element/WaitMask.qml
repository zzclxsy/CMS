import QtQuick 2.0
import "../"
Popup {
    id: popup
    color: "#00000000"
    width: 200
    height: 200
    anchors.centerIn: parent
    showMask: true
    visible: false
    maskOpacity:0.5

    AnimatedImage {
        id: image
        height: 150
        anchors.fill: parent
        source: "qrc:/image/wait.gif"
        anchors.topMargin: 51
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        x: 0
        width: 128
        height: 50
        text: qsTr("Wait for a moment, please")
        anchors.top: parent.top
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 0
    }

}
