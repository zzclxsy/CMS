import QtQuick 2.0
import QtQuick.Controls 2.5
import logininterface 1.0
import QtGraphicalEffects 1.12
Item {
    id: root
    width: 968
    height: 450
    x:0
    y:0
    signal closeLogin()
    signal registerClicked()
    property point deltaPos: "0,0"  //定义一个点
    state: "normal"
    LoginInterface{
        id:loginInterface
    }

    //主页面rect
    Rectangle {
        id: mainRect
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        clip: true

        Rectangle {
            id: loginRect
            x: 620
            width: 350
            color: "#0d335d"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            //标题，CMS上位机
            TextEdit {
                width: 252
                color: "#edebeb"
                text: qsTr("CMS上位机")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 53
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                readOnly: true
                anchors.bottomMargin: 273
                anchors.topMargin: 34
                textFormat: Text.PlainText
                font.weight: Font.Normal
            }

            Row {
                id: userNamerow
                x: 87
                y: 200
                width: 271
                height: 40
                anchors.bottom: parent.bottom
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 210

                Text {
                    width: 83
                    height: 48
                    color: "#edebeb"
                    text: qsTr("Account")
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
                        x: 1
                        y: 32
                        height: 1
                        color: "#ffffff"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                    }

                    MouseArea{
                        anchors.fill: userName
                        cursorShape:Qt.IBeamCursor

                    }
                    TextInput {
                        id: userName
                        y: 10
                        height: 24
                        color: "#ffffff"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        maximumLength: 32767
                        passwordCharacter: "\u25cf"
                        inputMask: ""
                        font.hintingPreference: Font.PreferDefaultHinting
                        persistentSelection: false
                        activeFocusOnPress: true
                        autoScroll: true
                        overwriteMode: false
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        renderType: Text.QtRendering
                        selectByMouse: true
                        cursorVisible: false
                        clip: true //设置此属性
                        selectionColor: "#3d85ac"
                        selectedTextColor: "#b9bdc1"
                        mouseSelectionMode: TextInput.SelectWords
                        Keys.onTabPressed: {
                            password.focus = true
                        }
                    }
                }

            }

            Row {
                id: passwordrow
                x: 39
                y: 238
                width: 271
                height: 48
                anchors.bottom: parent.bottom
                layoutDirection: Qt.RightToLeft
                anchors.bottomMargin: 164


                Rectangle {
                    x: 0
                    width: 189
                    height: 48
                    color: "#00000000"
                    border.color: "#00000000"
                    border.width: 1
                    Rectangle {
                        y: 31
                        height: 1
                        color: "#ffffff"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                    }

                    MouseArea {
                        anchors.fill: password
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: password
                        width: 190
                        color: "#ffffff"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        maximumLength: 32767
                        echoMode: TextInput.Password
                        anchors.bottomMargin: 14
                        selectionColor: "#3d85ac"
                        mouseSelectionMode: TextInput.SelectWords
                        anchors.topMargin: 8
                        selectedTextColor: "#b9bdc1"
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        renderType: Text.QtRendering
                        selectByMouse: true
                        cursorVisible: false
                        clip: true //设置此属性
                        Keys.onTabPressed: {
                            userName.focus = true
                        }
                    }
                }

                Text {
                    x: 0
                    width: 83
                    height: 48
                    color: "#edebeb"
                    text: qsTr("Password")
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 33
                }
            }

            //英文全称标题
            Text {
                y: 131
                height: 36
                color: "#ffffff"
                text: qsTr("Control System Management")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 70
                anchors.leftMargin: 69
                anchors.bottomMargin: 283
            }

            Rectangle {
                id: loginBtn
                y: 318
                width: 113
                height: 43
                color: "#00a7c0dc"
                radius: 2
                border.color: "#80d6e0f1"
                border.width: 1
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 126
                anchors.bottomMargin: 89

                Text {
                    id: text4
                    text: qsTr("Login")
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    x: 42
                    y: 6
                    width: 63
                    height: 32
                    color: "#ffffff"
                }

                Rectangle {
                    id: rectangle5
                    x: 7
                    y: 5
                    width: 38
                    height: 33
                    color: "#00ffffff"

                    Image {
                        id: image2
                        anchors.fill: parent
                        source: "image/loginBtn.svg"
                        fillMode: Image.PreserveAspectFit
                        ColorOverlay{
                            id :coloroverlay
                            anchors.fill: image2
                            source: image2
                            color: "#a7c0dc"
                        }
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: loginBtn
                    hoverEnabled: true
                    property bool m_isEnter:false
                    onClicked: {
                        //loginInterface.IsCanLogin(userName.text,password.text);
                    }
                    onEntered:{
                        m_isEnter = true
                        loginBtn.border.color= "#d6e0f1"
                        //text4.color = "#000000"
                        //coloroverlay.color = "#43474d"
                    }
                    onExited: {
                        m_isEnter = false
                        loginBtn.border.color= "#80d6e0f1"
                        //text4.color = "#ffffff"
                        //coloroverlay.color = "#a7c0dc"
                    }
                    onPressed: {
                        loginBtn.border.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            loginBtn.border.color="#d6e0f1"
                    }
                }
            }

            Rectangle {
                id: registerBtn
                y: 421
                height: 29
                color: "#00a7c0dc"
                radius: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 270
                anchors.bottomMargin: 0
                anchors.rightMargin: 8

                Text {
                    id: text5
                    text: qsTr("Register")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    color: "#80d6e0f1"
                    property bool m_isEnter:false

                    MouseArea {
                        id: mouseArea2
                        anchors.fill: parent
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        hoverEnabled: true
                        onClicked: {
                            registerClicked()
                        }

                        onEntered:{
                            text5.m_isEnter = true
                            text5.color= "#ffffff"
                        }
                        onExited: {
                            text5.m_isEnter = false
                            text5.color= "#80d6e0f1"
                        }
                        onPressed: {
                            text5.color="#5097ee"
                        }
                        onReleased: {
                            if (text5.m_isEnter == true)
                                text5.color="#ffffff"
                        }
                    }
                }
            }

            Rectangle {
                id: forgetBtn
                x: 8
                y: 421
                width: 72
                height: 29
                color: "#00ffffff"

                Text {
                    id: text6
                    text: qsTr("Forget")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: "#80d6e0f1"
                    MouseArea {
                        anchors.fill: parent
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        hoverEnabled: true
                        property bool m_isEnter:false
                        onClicked: {
                            registerClicked()
                        }

                        onEntered:{
                            m_isEnter = true
                            text6.color= "#ffffff"
                        }
                        onExited: {
                            m_isEnter = false
                            text6.color= "#80d6e0f1"
                        }
                        onPressed: {
                            text6.color="#5097ee"
                        }
                        onReleased: {
                            if (m_isEnter == true)
                                text6.color="#ffffff"
                        }
                    }
                }
            }

        }

        Rectangle {
            id: logImage
            width: 532
            color: "#f7a9a9"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: loginRect.left
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 25
            Image {
                id: image
                anchors.fill: parent
                verticalAlignment: Image.AlignBottom
                source: "qrc:/image/login2.jpg"
                anchors.rightMargin: -25
                asynchronous: false
                mirror: false
                sourceSize.height: 300
                sourceSize.width: 300
                fillMode: Image.PreserveAspectCrop

                MouseArea{
                    anchors.fill: image
                    property point clickPos: "0,0"  //定义一个点
                    onPressed: {
                        clickPos = Qt.point(mouseX, mouseY)
                    }

                    onPositionChanged: {
                        deltaPos = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    }

                }
            }
        }


    }

    //关闭窗口的按钮
    Rectangle {
        id: closeRect
        x: 940
        width: 28
        height: 24
        color: "transparent"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0

        Image {
            id: closeimage
            anchors.fill: parent
            source: "image/close.png"
            cache: false
            fillMode: Image.PreserveAspectFit
            ColorOverlay{
                anchors.fill: closeimage
                source: closeimage
                color: "#a7c0dc"
            }
            MouseArea{
                anchors.fill: parent
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
                    console.log("关闭登录窗口")
                    closeLogin()
                }
            }
        }
    }


    //设置动画
    states: [
        State {                         //状态1
            name: "normal"              //设置状态名称
            PropertyChanges {           //性质改变
                target: root
                x:0
            }
        },
        State {                         //状态2
            name: "hide"
            PropertyChanges {           //性质改变
                target: root
                x:-root.width
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







