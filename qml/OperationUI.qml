import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQml 2.12

Item {
    id :itemroot
    width: 1400
    height: 900
    property point deltaPos: "0,0"
    signal closeLogin()
    property bool g_currWinStatus: false

    Rectangle {
        id: mainRect
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0

        MouseDarg{
            id:darg
            operObj: root
            onChangePosChanged: {
                if (g_mousePos === "middle")
                    deltaPos = changePos
            }

            ListView {
                id: listView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 8
                anchors.leftMargin: 186
                anchors.bottomMargin: 8
                anchors.topMargin: 53

                clip: true
                orientation: ListView.Vertical
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                highlightMoveDuration:300
                interactive:false
                spacing: 5
                model: ListModel {
                    ListElement {
                        name: "userInfPage"
                    }

                    ListElement {
                        name: "applicationWin"
                    }

                    ListElement {
                        name: "logShow"
                    }

                    ListElement {
                        name: "hardware"
                    }
                    ListElement {
                        name: "monitor"
                    }
                }
                delegate:  Rectangle {
                    width: listView.width
                    height: listView.height
                    Component.onCompleted: {
                        if (name === "userInfPage")
                        {
                            userInfoWin.visible = true
                            userInfoWin.parent =this
                            userInfoWin.anchors.fill =this
                        }
                        else if (name === "applicationWin")
                        {
                            applicationWin.visible = true
                            applicationWin.parent =this
                            applicationWin.anchors.fill =this
                        }
                        else if (name === "logShow")
                        {
                            logShow.visible = true
                            logShow.parent =this
                            logShow.anchors.fill =this
                        }
                        else if (name === "hardware")
                        {
                            hardware.visible = true
                            hardware.parent =this
                            hardware.anchors.fill =this
                        }
                        else if (name === "monitor")
                        {
                            monitor.visible = true
                            monitor.parent =this
                            monitor.anchors.fill =this
                        }
                    }
                }
            }


            Rectangle {
                id: rectangle
                width: 180
                color: "#164e8b"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }


            Column {
                id: column
                width: 164
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 8
                anchors.bottomMargin: 0
                anchors.topMargin: 45
                spacing: 0

                Rectangle {
                    id: userBtn
                    width: 164
                    height: 145
                    color: "#ffffff"
                    border.width: 0
                    property bool m_isClicked: true
                    Image {
                        id: image3
                        x: 57
                        width: 80
                        height: 65
                        anchors.top: parent.top
                        source: "qrc:/image/user.svg"
                        anchors.topMargin: 8
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text2
                        height: 43
                        text: qsTr("Settings")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image3.bottom
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 6
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                    }
                    onM_isClickedChanged: {
                        if (m_isClicked)
                        {
                            userBtn.color = "#ffffff"
                            text2.color = "#000000"
                        }
                        else
                        {
                            userBtn.color = "#00ffffff"
                            text2.color = "#ffffff"
                        }
                    }

                    MouseArea{
                        width: 160
                        height: 140
                        anchors.fill: parent
                        onClicked: {
                            userBtn.m_isClicked = true
                            funcBtn.m_isClicked = false
                            logBtn.m_isClicked = false
                            hardwareBtn.m_isClicked = false
                            monitorBtn.m_isClicked = false
                            listView.currentIndex = 0
                        }
                    }
                }

                Rectangle {
                    id: funcBtn
                    width: 164
                    height: 145
                    color: "#004fe789"
                    border.width: 0
                    property bool m_isClicked: false

                    Image {
                        id: image4
                        x: 65
                        width: 80
                        height: 65
                        anchors.top: parent.top
                        source: "qrc:/image/function.svg"
                        anchors.topMargin: 8
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text1
                        height: 43
                        color: "#ffffff"
                        text: qsTr("Application")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image4.bottom
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.leftMargin: 0
                        anchors.rightMargin: -2
                    }
                    onM_isClickedChanged: {
                        if (m_isClicked)
                        {
                            funcBtn.color = "#ffffff"
                            text1.color = "#000000"
                        }
                        else
                        {
                            funcBtn.color = "#00ffffff"
                            text1.color = "#ffffff"
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
                            listView.currentIndex = 1
                        }
                    }
                }

                Rectangle {
                    id: logBtn
                    width: 164
                    height: 146
                    color: "#005e1fbe"
                    border.width: 0
                    property bool m_isClicked: false
                    Image {
                        id: image5
                        x: 60
                        width: 80
                        height: 65
                        anchors.top: parent.top
                        source: "qrc:/image/log.svg"
                        anchors.topMargin: 7
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text3
                        height: 43
                        color: "#f9f8f8"
                        text: qsTr("LogShow")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image5.bottom
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: -2
                        anchors.leftMargin: 0
                    }
                    onM_isClickedChanged: {
                        if (m_isClicked)
                        {
                            logBtn.color = "#ffffff"
                            text3.color = "#000000"
                        }
                        else
                        {
                            logBtn.color = "#00ffffff"
                            text3.color = "#ffffff"
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
                            listView.currentIndex = 2
                        }
                    }
                }

                Rectangle {
                    id: hardwareBtn
                    width: 164
                    height: 145
                    color: "#00f612f2"
                    border.width: 0
                    property bool m_isClicked: false
                    Image {
                        id: image6
                        x: 77
                        y: 7
                        width: 80
                        height: 65
                        source: "qrc:/image/sharpicons_processor-2.svg"
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text4
                        height: 43
                        color: "#ffffff"
                        text: qsTr("Hardware")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image6.bottom
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: -2
                        anchors.leftMargin: 0
                    }
                    onM_isClickedChanged: {
                        if (m_isClicked)
                        {
                            hardwareBtn.color = "#ffffff"
                            text4.color = "#000000"
                        }
                        else
                        {
                            hardwareBtn.color = "#00ffffff"
                            text4.color = "#ffffff"
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
                            listView.currentIndex = 3
                        }
                    }
                }

                Rectangle {
                    id: monitorBtn
                    width: 164
                    height: 145
                    color: "#00ffffff"
                    property bool m_isClicked: false
                    Image {
                        id: image7
                        x: 37
                        width: 80
                        height: 65
                        anchors.top: parent.top
                        source: "qrc:/image/monitor.svg"
                        anchors.topMargin: 8
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: text5
                        height: 43
                        color: "#ffffff"
                        text: qsTr("Monitor")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image7.bottom
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: -2
                        anchors.leftMargin: 0
                    }
                    onM_isClickedChanged: {
                        if (m_isClicked)
                        {
                            monitorBtn.color = "#ffffff"
                            text5.color = "#000000"
                        }
                        else
                        {
                            monitorBtn.color = "#00ffffff"
                            text5.color = "#ffffff"
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
                            listView.currentIndex = 4
                        }
                    }
                }
            }

            UserInfo{
                id:userInfoWin
                visible: false
            }
            ApplicationWin{
                id:applicationWin
                visible: false
            }
            LogShow{
                id:logShow
                visible: false
            }

            Hardware{
                id:hardware
                visible: false
            }
            Monitor{
                id:monitor
                visible: false
            }

            Rectangle {
                id: rectangle1
                height: 2
                color: "#e8e8e8"
                anchors.left: rectangle.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 45
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            Rectangle {
                id: stateRect
                height: 42
                color: "#ffffff"
                anchors.left: rectangle.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 112
                anchors.leftMargin: 0
                MouseArea{
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
                            deltaPos = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

                        doubleClick = false
                    }
                }
            }




        }


        Row {
            id: row
            x: 1156
            y: 11
            width: 100
            height: 24
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: 7
            anchors.topMargin: 8
            anchors.rightMargin: 0

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

    DropShadow {
        anchors.fill: mainRect
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5
        samples: 11
        source: mainRect
        color: "black"
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:39}
}
##^##*/
