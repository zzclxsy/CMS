import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
Item {
    id: root
    state: "hide"
    signal goHomeClicked()
    property point deltaPos: "0,0"  //定义一个点
    property var userName
    function getUserName(name)
    {
        question.text = UsersModel.getQuestion((name))
        userName = name
    }

    function clearPageData()
    {
        question.text = ""
        answer.text = ""
        password.text = ""
        answer.focus = true
    }

    MessagePopup{
        id:popup
    }

    Rectangle {
        id: mainRect
        width: 654
        color: "#0d335d"
        anchors.fill: parent

        MouseArea{
            id: mouseArea
            anchors.fill: mainRect
            property point clickPos: "0,0"
            width: 685  //定义一个点
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {
                deltaPos = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            }

            Rectangle {
                id: rectangle
                x: 186
                y: 92
                width: 316
                height: 250
                color: "#00f93d3d"
                anchors.horizontalCenter: parent.horizontalCenter

                Row {
                    id: userNamerow2
                    x: 88
                    y: 112
                    width: 287
                    height: 40
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 98
                    anchors.horizontalCenterOffset: -3
                    Text {
                        width: 108
                        height: 48
                        color: "#edebeb"
                        text: qsTr("NewPassword")
                        font.pixelSize: 17
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        minimumPixelSize: 33
                    }

                    Rectangle {
                        x: 0
                        width: 200
                        height: 48
                        color: "#00000000"
                        border.color: "#00000000"
                        border.width: 1
                        Rectangle {
                            id: bottomLine2
                            x: 1
                            y: 32
                            width: 196
                            height: 1
                            color: "#ffffff"
                        }

                        MouseArea {
                            anchors.fill: password
                            cursorShape: Qt.IBeamCursor
                        }

                        TextInput {
                            id: password
                            y: 10
                            width: 197
                            height: 24
                            color: "#ffffff"
                            font.pixelSize: 18
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            overwriteMode: false
                            mouseSelectionMode: TextInput.SelectWords
                            maximumLength: 32767
                            activeFocusOnPress: true
                            selectByMouse: true
                            selectedTextColor: "#b9bdc1"
                            selectionColor: "#3d85ac"
                            cursorVisible: false
                            clip: true
                            onFocusChanged: {
                                if (password.focus == true)
                                    bottomLine2.color = "#5097ee"
                                else
                                    bottomLine2.color = "#ffffff"
                            }
                            validator: RegExpValidator {
                                regExp: /[0-9A-Za-z]+/
                            }
                            Keys.onTabPressed: {
                                answer.focus = true
                            }
                            persistentSelection: false
                            font.hintingPreference: Font.PreferDefaultHinting
                            passwordCharacter: "\u25cf"
                            autoScroll: true
                            renderType: Text.QtRendering
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    id: userNamerow3
                    x: 86
                    y: 8
                    width: 287
                    height: 40
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 202
                    anchors.horizontalCenterOffset: -3
                    Text {
                        width: 108
                        height: 48
                        color: "#edebeb"
                        text: qsTr("Question")
                        font.pixelSize: 17
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        minimumPixelSize: 33
                    }

                    Rectangle {
                        width: 197
                        height: 48
                        color: "#00000000"
                        border.color: "#00000000"
                        border.width: 1
                        Rectangle {
                            id: bottomLine3
                            x: 1
                            y: 32
                            width: 195
                            height: 1
                            color: "#ffffff"
                        }

                        MouseArea {
                            anchors.fill: question
                            cursorShape: Qt.IBeamCursor
                        }

                        TextInput {
                            id: question
                            y: 10
                            width: 194
                            height: 24
                            color: "#ffffff"
                            anchors.left: parent.left
                            font.pixelSize: 18
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            readOnly: true
                            overwriteMode: false
                            mouseSelectionMode: TextInput.SelectWords
                            maximumLength: 32767
                            anchors.leftMargin: 0
                            activeFocusOnPress: true
                            selectByMouse: true
                            selectedTextColor: "#b9bdc1"
                            selectionColor: "#3d85ac"
                            cursorVisible: false
                            clip: true

                            persistentSelection: false
                            font.hintingPreference: Font.PreferDefaultHinting
                            passwordCharacter: "\u25cf"
                            autoScroll: true
                            renderType: Text.QtRendering
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    id: userNamerow1
                    x: 84
                    y: 60
                    width: 287
                    height: 40
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 150
                    anchors.horizontalCenterOffset: -3
                    Text {
                        width: 108
                        height: 48
                        color: "#edebeb"
                        text: qsTr("Answer")
                        font.pixelSize: 17
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        minimumPixelSize: 33
                    }

                    Rectangle {
                        width: 187
                        height: 48
                        color: "#00000000"
                        border.color: "#00000000"
                        border.width: 1
                        Rectangle {
                            id: bottomLine1
                            x: 1
                            y: 32
                            width: 194
                            height: 1
                            color: "#ffffff"
                        }

                        MouseArea {
                            anchors.fill: answer
                            cursorShape: Qt.IBeamCursor
                        }

                        TextInput {
                            id: answer
                            y: 10
                            width: 196
                            height: 24
                            color: "#ffffff"
                            anchors.left: parent.left
                            font.pixelSize: 18
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            overwriteMode: false
                            mouseSelectionMode: TextInput.SelectWords
                            maximumLength: 32767
                            anchors.leftMargin: 0
                            activeFocusOnPress: true
                            selectByMouse: true
                            selectedTextColor: "#b9bdc1"
                            selectionColor: "#3d85ac"
                            cursorVisible: false
                            clip: true
                            onFocusChanged: {
                                if (answer.focus == true)
                                    bottomLine1.color = "#5097ee"
                                else
                                    bottomLine1.color = "#ffffff"
                            }

                            Keys.onTabPressed: {
                                password.focus = true
                            }
                            persistentSelection: false
                            font.hintingPreference: Font.PreferDefaultHinting
                            passwordCharacter: "\u25cf"
                            autoScroll: true
                            renderType: Text.QtRendering
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: loginBtn
                x: 241
                y: 348
                width: 152
                height: 43
                color: "#00a7c0dc"
                radius: 2
                border.color: "#80d6e0f1"
                border.width: 1
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text4
                    color: "#ffffff"
                    text: qsTr("Affirm")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    id: mouseArea1
                    onPressed: {
                        loginBtn.border.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            loginBtn.border.color="#d6e0f1"
                    }
                    property bool m_isEnter: false
                    anchors.fill: parent
                    onEntered: {
                        m_isEnter = true
                        loginBtn.border.color= "#d6e0f1"
                    }
                    onExited: {
                        m_isEnter = false
                        loginBtn.border.color= "#80d6e0f1"
                    }
                    hoverEnabled: true
                    onClicked: {
                        var ret =  Logindata.judgeSecurityQuestion(userName, question.text, answer.text);
                        if (ret !== "")
                        {
                            var obj = JSON.parse(ret)
                            popup.errorMessage(obj["error"]["message"])
                        }
                        else
                        {
                            var ret2 = Logindata.setNewPassword(userName, password.text)
                            if (ret2 !== "")
                            {
                                var obj2 = JSON.parse(ret2)
                                popup.errorMessage(obj2["error"]["message"])
                            }
                            else
                                popup.informMessage("修改成功")
                        }
                    }
                }
            }

        }

        Rectangle {
            id: gohomeRect
            x: 0
            y: 0
            width: 32
            height: 32
            color: "#00ffffff"

            Image {
                id: gohomeimage
                anchors.fill: parent
                source: "qrc:image/gohome.svg"
                mirror: false
                sourceSize.height: 183
                sourceSize.width: 176
                fillMode: Image.Stretch
                ColorOverlay{
                    id :coloroverlay
                    anchors.fill: gohomeimage
                    source: gohomeimage
                    color: "#a7c0dc"
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    property bool m_isEnter: false
                    onClicked: {
                        goHomeClicked()
                    }

                    onEntered:{
                        m_isEnter = true
                        coloroverlay.color= "#ffffff"
                    }
                    onExited: {
                        m_isEnter = false
                        coloroverlay.color= "#a7c0dc"
                    }
                    onPressed: {
                        coloroverlay.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            coloroverlay.color="#ffffff"
                    }
                }
            }
        }


    }


    //设置动画
    states: [
        State {                         //状态1
            name: "hide"              //设置状态名称
            PropertyChanges {           //性质改变
                target: root
                x:root.width
            }
        },
        State {                         //状态2
            name: "normal"
            PropertyChanges {           //性质改变
                target: root
                x:0
            }
        }
    ]

    transitions: [
        Transition {
            from: "normal"
            to: "hide"
            PropertyAnimation{
                properties: "x"  //基于哪些属性变化（属性名称）
                duration: 300                    //过程时间
            }
        },
        Transition {
            from: "hide"
            to: "normal"
            PropertyAnimation{
                properties: "x"  //基于哪些属性变化（属性名称）
                duration: 300                    //过程时间
            }
        }
    ]
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
