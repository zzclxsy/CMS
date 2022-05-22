import QtQuick 2.0
import QtQml 2.12
import QtQuick.Controls 2.5
Item {
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent



        Connections{
            target: LogData
            onSetLogMessage:
            {
                var str = "";
                if (type === "debugLog")
                    str = debugLog.setText(message)
                else if (type === "infoLog")
                    str = infoLog.setText(message)
                else if (type === "warnLog")
                    str = warnLog.setText(message)
                else if (type === "errorLog")
                    str = errorLog.setText(message)

                allLog.setText(str)
            }
        }

        SwipeView {
            id: swipeView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 53
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            orientation:Qt.Horizontal
            interactive :false
            clip: true
            Flickable{
                id:flickAlllog
                ScrollBar.horizontal:ScrollBar{policy:ScrollBar.AsNeeded}
                ScrollBar.vertical:ScrollBar{policy:ScrollBar.AsNeeded}

                contentHeight:allLog.height
                contentWidth: allLog.width
                clip: true
                TextArea{
                    id:allLog
                    textFormat:TextEdit.RichText
                    readOnly: true
                    selectByMouse:true
                    selectedTextColor:"#ffffff"

                    selectionColor:"#6495ED"
                    clip: true
                    font{
                        family: "黑体"
                        pointSize: 18
                    }
                    property var beforeHeight: 0
                    property bool fristMove: true
                    function setText(message)
                    {
                        text = text + message

                        if (height >= flickAlllog.height)
                        {
                            var delta = height - beforeHeight;
                            var newPos = height - flickAlllog.height
                            if (flickAlllog.contentY + delta === newPos || fristMove)
                            {
                                flickAlllog.contentY = newPos
                                fristMove = false
                            }
                        }

                        beforeHeight = height
                    }
                }
            }
            Flickable{
                id:flickDebuglog
                ScrollBar.horizontal:ScrollBar{policy:ScrollBar.AsNeeded}
                ScrollBar.vertical:ScrollBar{policy:ScrollBar.AsNeeded}

                contentHeight:debugLog.height
                contentWidth: debugLog.width
                clip: true
                TextArea{
                    id:debugLog
                    textFormat:TextEdit.RichText
                    readOnly: true
                    selectByMouse:true
                    selectedTextColor:"#ffffff"

                    selectionColor:"#6495ED"
                    clip: true
                    font{
                        family: "黑体"
                        pointSize: 18
                    }
                    property var beforeHeight: 0
                    property bool fristMove: true
                    function setText(message)
                    {
                        var msg = "<font color=#AB82FF>" + message +"</font>"
                        debugLog.text = debugLog.text + msg

                        if (height >= flickDebuglog.height)
                        {
                            var delta = height - beforeHeight;
                            var newPos = height - flickDebuglog.height
                            if (flickDebuglog.contentY + delta === newPos || fristMove)
                            {
                                flickDebuglog.contentY = newPos
                                fristMove = false
                            }
                        }

                        beforeHeight = height
                        return msg
                    }
                }
            }
            Flickable{
                id:flickInfolog
                ScrollBar.horizontal:ScrollBar{policy:ScrollBar.AsNeeded}
                ScrollBar.vertical:ScrollBar{policy:ScrollBar.AsNeeded}

                contentHeight:infoLog.height
                contentWidth: infoLog.width
                clip: true
                TextArea{
                    id:infoLog
                    textFormat:TextEdit.RichText
                    readOnly: true
                    selectByMouse:true
                    selectedTextColor:"#ffffff"

                    selectionColor:"#6495ED"
                    clip: true
                    font{
                        family: "黑体"
                        pointSize: 18
                    }
                    property var beforeHeight: 0
                    property bool fristMove: true
                    function setText(message)
                    {
                        var msg = "<font color=#000000>" + message +"</font>"
                        infoLog.text = infoLog.text + msg

                        if (height >= flickInfolog.height)
                        {
                            var delta = height - beforeHeight;
                            var newPos = height - flickInfolog.height
                            if (flickInfolog.contentY + delta === newPos || fristMove)
                            {
                                flickInfolog.contentY = newPos
                                fristMove = false
                            }
                        }

                        beforeHeight = height
                        return msg
                    }
                }
            }
            Flickable{
                id:flickWarnlog
                ScrollBar.horizontal:ScrollBar{policy:ScrollBar.AsNeeded}
                ScrollBar.vertical:ScrollBar{policy:ScrollBar.AsNeeded}

                contentHeight:warnLog.height
                contentWidth: warnLog.width
                clip: true
                TextArea{
                    id:warnLog
                    textFormat:TextEdit.RichText
                    readOnly: true
                    selectByMouse:true
                    selectedTextColor:"#ffffff"

                    selectionColor:"#6495ED"
                    clip: true
                    font{
                        family: "黑体"
                        pointSize: 18
                    }
                    property var beforeHeight: 0
                    property bool fristMove: true
                    function setText(message)
                    {
                        var msg = "<font color=#CD9B1D>" + message +"</font>"
                        warnLog.text = warnLog.text + msg

                        if (height >= flickWarnlog.height)
                        {
                            var delta = height - beforeHeight;
                            var newPos = height - flickWarnlog.height
                            if (flickWarnlog.contentY + delta === newPos || fristMove)
                            {
                                flickWarnlog.contentY = newPos
                                fristMove = false
                            }
                        }

                        beforeHeight = height
                        return msg
                    }
                }
            }
            Flickable{
                id:flickErrorlog
                ScrollBar.horizontal:ScrollBar{policy:ScrollBar.AsNeeded}
                ScrollBar.vertical:ScrollBar{policy:ScrollBar.AsNeeded}

                contentHeight:errorLog.height
                contentWidth: errorLog.width
                clip: true
                TextArea{
                    id:errorLog
                    textFormat:TextEdit.RichText
                    readOnly: true
                    selectByMouse:true
                    selectedTextColor:"#ffffff"

                    selectionColor:"#6495ED"
                    clip: true
                    font{
                        family: "黑体"
                        pointSize: 18
                    }
                    property var beforeHeight: 0
                    property bool fristMove: true
                    function setText(message)
                    {
                        var msg = "<font color=#ff0000>" + message +"</font>"
                        errorLog.text = errorLog.text + msg

                        if (height >= flickErrorlog.height)
                        {
                            var delta = height - beforeHeight;
                            var newPos = height - flickErrorlog.height
                            if (flickErrorlog.contentY + delta === newPos || fristMove)
                            {
                                flickErrorlog.contentY = newPos
                                fristMove = false
                            }
                        }

                        beforeHeight = height
                        return msg
                    }
                }
            }
        }
    }


    Row {
        id: row
        x: 0
        y: 0
        width: 640
        height: 50
        spacing: 7

        Rectangle {
            id: allrect
            width: 100
            height: 50
            color: "#25d29a"
            radius: 7
            border.width: 0
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    swipeView.currentIndex = 0
                }
                onPressed: {
                    parent.color = "#cef1e5"
                }
                onReleased: {
                    allrect.color = "#25d29a"
                    debugBtn.color = "#9ff4d7"
                    infoBtn.color = "#9ff4d7"
                    warnBtn.color = "#9ff4d7"
                    errorBtn.color = "#9ff4d7"
                }
            }
            Text {
                id: text1
                text: qsTr("All")
                anchors.fill: parent
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

        Rectangle {
            id: debugBtn
            width: 100
            height: 50
            color: "#9ff4d7"
            radius: 7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    swipeView.currentIndex = 1
                }
                onPressed: {
                    parent.color = "#cef1e5"
                }
                onReleased: {
                    allrect.color = "#9ff4d7"
                    debugBtn.color = "#25d29a"
                    infoBtn.color = "#9ff4d7"
                    warnBtn.color = "#9ff4d7"
                    errorBtn.color = "#9ff4d7"
                }
            }
            Text {
                id: text2
                text: qsTr("Debug")
                anchors.fill: parent
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

        Rectangle {
            id: infoBtn
            width: 100
            height: 50
            color: "#9ff4d7"
            radius: 7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    swipeView.currentIndex = 2
                }
                onPressed: {
                    parent.color = "#cef1e5"
                }
                onReleased: {
                    allrect.color = "#9ff4d7"
                    debugBtn.color = "#9ff4d7"
                    infoBtn.color = "#25d29a"
                    warnBtn.color = "#9ff4d7"
                    errorBtn.color = "#9ff4d7"
                }
            }
            Text {
                id: text3
                text: qsTr("Info")
                anchors.fill: parent
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: warnBtn
            width: 100
            height: 50
            color: "#9ff4d7"
            radius: 7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    swipeView.currentIndex = 3
                }
                onPressed: {
                    parent.color = "#cef1e5"
                }
                onReleased: {
                    allrect.color = "#9ff4d7"
                    debugBtn.color = "#9ff4d7"
                    infoBtn.color = "#9ff4d7"
                    warnBtn.color = "#25d29a"
                    errorBtn.color = "#9ff4d7"
                }
            }
            Text {
                id: text4
                text: qsTr("Warn")
                anchors.fill: parent
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: errorBtn
            width: 100
            height: 50
            color: "#9ff4d7"
            radius: 7
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    swipeView.currentIndex = 4
                }
                onPressed: {
                    parent.color = "#cef1e5"
                }
                onReleased: {
                    allrect.color = "#9ff4d7"
                    debugBtn.color = "#9ff4d7"
                    infoBtn.color = "#9ff4d7"
                    warnBtn.color = "#9ff4d7"
                    errorBtn.color = "#25d29a"
                }
            }
            Text {
                id: text5
                text: qsTr("Error")
                anchors.fill: parent
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.8999999761581421;height:480;width:640}
}
##^##*/
