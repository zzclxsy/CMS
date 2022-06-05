import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQml 2.12
import QtQuick.Controls 2.5

Item {
    id :itemroot
    width: 1400
    height: 900
    property point deltaPos: "0,0"
    signal closeLogin()
    property bool g_currWinStatus: false

    DropShadow {
        anchors.fill: mainRect
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 11
        source: mainRect
        color: "black"
    }
    onG_currWinStatusChanged: {
        logShow.winChange(g_currWinStatus)
        if (g_currWinStatus)
            root.g_isDrag = false
        else
            root.g_isDrag = true
    }

    Connections{
        target: LogManager
        onTcpLinkChange:{
            if (isLink === true)
            {
                logLamp.source = "qrc:/image/lampOn.svg"
            }
            else
            {
                logLamp.source = "qrc:/image/lampOff.svg"
            }
        }
    }

    Rectangle {
        id: mainRect
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0

        SwipeView {
            id: swipeView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 85
            anchors.bottomMargin: 8
            anchors.leftMargin: 125
            anchors.rightMargin: 8
            orientation:Qt.Vertical
            interactive :false
            clip: true

            UserInfo{id:userInfoWin}
            ApplicationWin{id:applicationWin}
            LogShow{id:logShow}
            Hardware{id:hardware}
            Monitor{id:monitor}
        }

        Rectangle {
            id: rectangle
            width: 119
            color: "#164e8b"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: userBtn
                width: 100
                height: 100
                color: "#00ffffff"
                border.width: 0
                anchors.top: parent.top
                anchors.topMargin: 128
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                property bool m_isClicked: true
                x: 28
                Image {
                    id: image3
                    x: 57
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    source: "qrc:/image/infoClicked.svg"
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text2
                    height: 38
                    visible: true
                    text: qsTr("Settings")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: image3.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.capitalization: Font.MixedCase
                    font.family: "Arial"
                    font.italic: false
                    font.strikeout: false
                    font.underline: false
                    font.bold: false
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    color: "#ffffff"
                }
                onM_isClickedChanged: {
                    if (m_isClicked)
                    {
                        image3.source = "qrc:/image/infoClicked.svg"
                        text2.color = "#ffffff"
                    }
                    else
                    {
                        image3.source = "qrc:/image/userinfoNoClicked.svg"
                        text2.color = "#dbdbdb"
                    }
                }

                MouseArea{
                    width: 160
                    height: 140
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    onClicked: {
                        userBtn.m_isClicked = true
                        funcBtn.m_isClicked = false
                        logBtn.m_isClicked = false
                        hardwareBtn.m_isClicked = false
                        monitorBtn.m_isClicked = false
                        swipeView.currentIndex = 0
                    }
                }
            }

            Rectangle {
                id: funcBtn
                width: 100
                height: 100
                color: "#004fe789"
                border.width: 0
                anchors.top: parent.top
                anchors.topMargin: 234
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                property bool m_isClicked: false
                x: 37

                Image {
                    id: image4
                    x: 65
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    source: "qrc:/image/functionNoClicked.svg"
                    anchors.topMargin: 8
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text1
                    height: 43
                    color: "#dbdbdb"
                    text: qsTr("Apps")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: image4.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.strikeout: false
                    font.underline: false
                    font.italic: false
                    font.bold: true
                    font.capitalization: Font.MixedCase
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                }
                onM_isClickedChanged: {
                    if (m_isClicked)
                    {
                        image4.source = "qrc:/image/functionClicked.svg"
                        text1.color = "#ffffff"
                    }
                    else
                    {
                        image4.source = "qrc:/image/functionNoClicked.svg"
                        text1.color = "#dbdbdb"
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        userBtn.m_isClicked = false
                        funcBtn.m_isClicked = true
                        logBtn.m_isClicked = false
                        hardwareBtn.m_isClicked = false
                        monitorBtn.m_isClicked = false
                        swipeView.currentIndex = 1
                    }
                }
            }

            Rectangle {
                id: logBtn
                width: 100
                height: 100
                color: "#005e1fbe"
                border.width: 0
                anchors.top: parent.top
                anchors.topMargin: 340
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                property bool m_isClicked: false
                x: 21
                Image {
                    id: image5
                    x: 60
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    source: "qrc:/image/logNoClicked.svg"
                    anchors.topMargin: 7
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text3
                    height: 43
                    color: "#dbdbdb"
                    text: qsTr("LogShow")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: image5.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                }
                onM_isClickedChanged: {
                    if (m_isClicked)
                    {
                        image5.source = "qrc:/image/logClicked.svg"
                        text3.color = "#ffffff"
                    }
                    else
                    {
                        image5.source = "qrc:/image/logNoClicked.svg"
                        text3.color = "#dbdbdb"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        userBtn.m_isClicked = false
                        funcBtn.m_isClicked = false
                        logBtn.m_isClicked = true
                        hardwareBtn.m_isClicked = false
                        monitorBtn.m_isClicked = false
                        swipeView.currentIndex = 2
                    }
                }
            }

            Rectangle {
                id: hardwareBtn
                width: 100
                height: 100
                color: "#00f612f2"
                border.width: 0
                anchors.top: parent.top
                anchors.topMargin: 446
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                property bool m_isClicked: false
                x: 0
                Image {
                    id: image6
                    x: 77
                    y: 7
                    width: 50
                    height: 50
                    source: "qrc:/image/hardwareNoClicked.svg"
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text4
                    height: 43
                    color: "#dbdbdb"
                    text: qsTr("Hardware")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: image6.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.topMargin: 0
                    anchors.rightMargin: -2
                    anchors.leftMargin: 0
                }
                onM_isClickedChanged: {
                    if (m_isClicked)
                    {
                        image6.source = "qrc:/image/hardwareClicked.svg"
                        text4.color = "#ffffff"
                    }
                    else
                    {
                        image6.source = "qrc:/image/hardwareNoClicked.svg"
                        text4.color = "#dbdbdb"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        userBtn.m_isClicked = false
                        funcBtn.m_isClicked = false
                        logBtn.m_isClicked = false
                        hardwareBtn.m_isClicked = true
                        monitorBtn.m_isClicked = false
                        swipeView.currentIndex = 3
                    }
                }
            }

            Rectangle {
                id: monitorBtn
                width: 100
                height: 100
                color: "#00ffffff"
                anchors.top: parent.top
                anchors.topMargin: 552
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                property bool m_isClicked: false
                x: 21
                Image {
                    id: image7
                    x: 37
                    width: 50
                    height: 50
                    anchors.top: parent.top
                    source: "qrc:/image/monitorNoClicked.svg"
                    anchors.topMargin: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text5
                    height: 43
                    color: "#dbdbdb"
                    text: qsTr("Monitor")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: image7.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                }
                onM_isClickedChanged: {
                    if (m_isClicked)
                    {
                        image7.source = "qrc:/image/monitorClicked.svg"
                        text5.color = "#ffffff"
                    }
                    else
                    {
                        image7.source = "qrc:/image/monitorNoClicked.svg"
                        text5.color = "#dbdbdb"
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        userBtn.m_isClicked = false
                        funcBtn.m_isClicked = false
                        logBtn.m_isClicked = false
                        hardwareBtn.m_isClicked = false
                        monitorBtn.m_isClicked = true
                        swipeView.currentIndex = 4
                    }
                }
            }

            Image {
                id: image8
                x: 10
                y: 855
                width: 88
                height: 45
                anchors.bottom: parent.bottom
                source: "qrc:/image/CMS.png"
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: maskimage
                x: 10
                y: 31
                width: 80
                height: 80
                source: "qrc:/image/manUser.png"
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                smooth: true
                visible: false
            }

            Rectangle {
                id: rectangle3
                x: 10
                y: 31
                width: 80
                height: 80
                color: "#ffffff"
                radius: 50
                border.width: 0
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                visible: false
            }

            OpacityMask{
                anchors.fill: maskimage
                source: maskimage
                maskSource: rectangle3
            }
        }

        Rectangle {
            id: rectangle1
            y: 69
            height: 2
            color: "#e8e8e8"
            anchors.left: rectangle.right
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
        }

        Rectangle {
            id: stateRect
            height: 65
            color: "#ffffff"
            anchors.left: rectangle.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 3
            anchors.rightMargin: 174
            anchors.leftMargin: 0
            MouseArea{
                id: mouseArea
                anchors.fill: parent
                property bool doubleClick: false
                onDoubleClicked: {
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
                    doubleClick = true
                }
                property point clickPos: "0,0"  //定义一个点
                onPressed: {
                    clickPos = Qt.point(mouseX, mouseY)
                }

                onPositionChanged: {
                    if (doubleClick == false)
                    {
                        if (g_currWinStatus == false)
                            deltaPos = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    }
                    doubleClick = false
                }

                Text {
                    id: text6
                    x: 882
                    y: 8
                    width: 143
                    height: 49
                    text: qsTr("logStatus")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    font.pixelSize: 29
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 82
                }

                Image {
                    id: logLamp
                    x: 1023
                    y: 8
                    width: 76
                    height: 49
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    source: "qrc:/image/lampOff.svg"
                    anchors.rightMargin: 8
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: image10
                    x: 767
                    y: 8
                    width: 76
                    height: 49
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    source: "qrc:/image/lampOn.svg"
                    anchors.rightMargin: 264
                    anchors.verticalCenterOffset: 0
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: text7
                    x: 632
                    y: 19
                    width: 142
                    height: 50
                    text: qsTr("hwStatus")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 333
                    anchors.verticalCenterOffset: 0
                }
            }

            Rectangle {
                id: rectangle2
                x: 1098
                width: 2
                color: "#d3d2d2"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 8
                anchors.bottomMargin: 7
                anchors.rightMargin: 7
            }
        }




    }


    Row {
        id: row
        x: 1226
        y: 11
        width: 166
        height: 59
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 5
        anchors.topMargin: 8
        anchors.rightMargin: 8

        Rectangle {
            id: minBtn
            width: 50
            height: 60
            color: "#003ef05c"

            Image {
                id: image2
                width: 47
                height: 45
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/minwin.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }

            MouseArea{
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
                anchors.right: parent.right
                anchors.fill: parent
                onClicked: {
                    g_currWinStatus = false
                    root.showMinimized()
                }
            }
        }

        Rectangle {
            id: winSizeBtn
            width: 50
            height: 60
            color: "#00000000"

            Image {
                id: image
                x: -27
                y: 0
                width: 30
                height: 44
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/largeWin.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
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
            width: 47
            height: 60
            color: "#00ffffff"

            Image {
                id: image1
                x: 2
                y: 8
                width: 35
                height: 35
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/image/close.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }

            MouseArea{
                width: 50
                anchors.fill: parent
                anchors.rightMargin: -5
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

/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437}
}
##^##*/
