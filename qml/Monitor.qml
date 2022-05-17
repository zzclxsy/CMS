import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("Monitor")
            anchors.fill: parent
            font.pixelSize: 59
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

}
