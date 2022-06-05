import QtQuick 2.0
import QtGraphicalEffects 1.12
import "../"
Item{
    property alias content: load.source
    property alias title:titleContent.text
    property alias icon: image.source
    id:itemRoot

    signal closeWin()

    DropShadow {
        anchors.fill: rectangle
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 11
        source: rectangle
        color: "black"
    }
    Rectangle{
        id: rectangle
        anchors.fill: parent
        Rectangle {
            id: titleRect
            height: 39
            color: "#0d335d"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            //关闭窗口的按钮
            Rectangle {
                id: closeRect
                x: 608
                width: 32
                height: 22
                color: "transparent"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0

                Image {
                    id: closeimage
                    anchors.fill: parent
                    source: "qrc:/image/close.svg"
                    cache: false
                    fillMode: Image.PreserveAspectFit
                    ColorOverlay{
                        anchors.fill: closeimage
                        source: closeimage
                        color: "#638cba"
                    }
                    MouseArea{
                        anchors.fill: parent
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        hoverEnabled: true
                        onEntered: {
                            closeRect.color="#e1453c"
                        }
                        onExited: {
                            closeRect.color="transparent"
                        }
                        onPressed: {
                            closeRect.color = "#e58a84"
                        }

                        onClicked: {
                            closeWin()
                        }
                    }
                }
            }

            Text {
                id: titleContent
                width: 279
                color: "#fdfdfd"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 23
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Verdana"
                font.italic: false
                font.underline: false
                font.bold: false
                anchors.leftMargin: 40
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }

            Image {
                id: image
                width: 30
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: ""
                anchors.leftMargin: 4
                anchors.bottomMargin: 4
                anchors.topMargin: 5
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: contentRect
            color: "#ffffff"
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 39
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            MouseArea{
                anchors.fill: parent
            }

            Loader{
                id:load
                anchors.fill: parent
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:8}D{i:9}
}
##^##*/
