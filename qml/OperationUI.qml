import QtQuick 2.0

Item {
    width: 1000
    height: 800
    property point deltaPos: "0,0"
    signal closeLogin()

    Rectangle {
        id: mainRect
        color: "#ec7d7d"
        anchors.fill: parent
        MouseArea{
            id: mouseArea
            anchors.fill: parent
            property point clickPos: "0,0"
            onPressed: {
                clickPos = Qt.point(mouse.x, mouse.y)
            }
            onPositionChanged: {
                deltaPos = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            }


            Row {
                id: row
                width: 82
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 776
                anchors.leftMargin: 919

                Rectangle {
                    id: minBtn
                    width: 27
                    height: 24
                    color: "#3ef05c"

                    Image {
                        id: image2
                        anchors.fill: parent
                        source: "qrc:/image/minwin.svg"
                        fillMode: Image.PreserveAspectCrop
                    }
                }

                Rectangle {
                    id: winSizeBtn
                    width: 27
                    height: 24
                    color: "#cb3434"

                    Image {
                        id: image
                        x: -27
                        y: 0
                        anchors.fill: parent
                        source: "qrc:/image/largeWin.svg"
                        fillMode: Image.PreserveAspectCrop
                    }
                }

                Rectangle {
                    id: closeBtn
                    width: 27
                    height: 24
                    color: "#ffffff"

                    Image {
                        id: image1
                        x: -54
                        y: 0
                        anchors.fill: parent
                        source: "qrc:/image/close.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                }

            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.100000023841858}D{i:5}D{i:7}D{i:9}D{i:3}
}
##^##*/
