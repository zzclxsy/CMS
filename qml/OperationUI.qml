import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQml 2.12

Item {
    id :itemroot
    width: 1400
    height: 900
    property alias listviewCurrIndex: listView.currentIndex
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
                anchors.leftMargin: 125
                anchors.bottomMargin: 8
                anchors.topMargin: 77

                clip: true
                orientation: ListView.Vertical
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                currentIndex: 0
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
                delegate:listviewdelegate
            }

            Component{
                id:listviewdelegate
                Rectangle {
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
                    anchors.topMargin: 18
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
                        font.family: "Tahoma"
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
                            listView.currentIndex = 0
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
                    anchors.topMargin: 130
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
                            listView.currentIndex = 1
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
                    anchors.topMargin: 242
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
                            listView.currentIndex = 2
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
                    anchors.topMargin: 360
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
                            listView.currentIndex = 3
                        }
                    }
                }

                Rectangle {
                    id: monitorBtn
                    width: 100
                    height: 100
                    color: "#00ffffff"
                    anchors.top: parent.top
                    anchors.topMargin: 478
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
                            listView.currentIndex = 4
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
                    source: "qrc:/image/cms.jpg"
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
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
                height: 42
                color: "#ffffff"
                anchors.left: rectangle.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 3
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
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:14}D{i:18}D{i:22}D{i:26}D{i:30}D{i:34}
D{i:41}
}
##^##*/
