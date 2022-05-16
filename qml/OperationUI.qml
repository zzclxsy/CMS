import QtQuick 2.0
import QtGraphicalEffects 1.12
Item {
    id :itemroot
    width: 1000
    height: 800
    property point deltaPos: "0,0"
    signal closeLogin()
    property bool g_currWinStatus: false
    Rectangle {
        id: mainRect
        color: "#f4ecec"
        anchors.fill: parent

        MouseDarg{
            id:darg
            operObj: root
            onChangePosChanged: {
                if (g_mousePos === "middle")
                    deltaPos = changePos
            }

            Rectangle {
                id: rectangle
                x: 440
                y: 270
                width: 200
                height: 200
                color: "#e6e0e0"
            }
        }


        Row {
            id: row
            x: 901
            width: 100
            height: 24
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: 7
            anchors.topMargin: 0
            anchors.rightMargin: -1

            Rectangle {
                id: minBtn
                width: 28
                height: 24
                color: "#003ef05c"

                Image {
                    id: image2
                    anchors.fill: parent
                    source: "qrc:/image/minwin.svg"
                    fillMode: Image.PreserveAspectCrop
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        minBtn.color="#e6e0e0"
                    }
                    onExited: {
                        minBtn.color="#00000000"
                    }
                    onPressed: {
                        minBtn.color = "#e6e0e0"

                    }
                    property size beforeWinSize
                    property point beforeWinPos: "0,0"
                    onClicked: {
                        g_currWinStatus = false
                        root.showMinimized()
                    }
                }
            }

            Rectangle {
                id: winSizeBtn
                width: 27
                height: 24
                color: "#00000000"

                Image {
                    id: image
                    x: -27
                    y: 0
                    width: 20
                    height: 18
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/image/largeWin.svg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectCrop
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        winSizeBtn.color="#e6e0e0"
                    }
                    onExited: {
                        winSizeBtn.color="#00000000"
                    }
                    onPressed: {
                        winSizeBtn.color = "#e6e0e0"

                    }
                    onClicked: {
                        if (g_currWinStatus === false)
                        {
                            g_currWinStatus = true
                            root.showMaximized()
                        }
                        else if (g_currWinStatus === true)
                        {
                            g_currWinStatus = false
                            root.showNormal()
                        }
                    }
                }
            }

            Rectangle {
                id: closeBtn
                width: 27
                height: 24
                color: "#00ffffff"

                Image {
                    id: image1
                    x: -54
                    y: 0
                    anchors.fill: parent
                    source: "qrc:/image/close.svg"
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        closeBtn.color="#e1453c"
                    }
                    onExited: {
                        closeBtn.color="#00ffffff"
                    }
                    onPressed: {
                        closeBtn.color = "#e58a84"
                    }

                    onClicked: {
                        closeLogin()
                    }
                }
            }

        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:3}
}
##^##*/
