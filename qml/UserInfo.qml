import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0

        Rectangle {
            id: rectangle6
            x: 183
            y: 50
            width: 331
            height: 378
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle5
                x: 243
                width: 124
                height: 49
                color: "#8bd2fc"
                radius: 6
                anchors.top: parent.top
                anchors.topMargin: 309
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: text5
                    text: qsTr("Affirm ")
                    anchors.fill: parent
                    font.pixelSize: 23
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 14
                }
            }

            Rectangle {
                id: rectangle4
                x: 148
                width: 313
                height: 49
                color: "#00b98e8e"
                anchors.top: parent.top
                anchors.topMargin: 211
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text4
                    text: qsTr("Answer")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: -2
                    anchors.rightMargin: 228
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }

                Rectangle {
                    color: "#00000000"
                    border.color: "#00000000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 30
                    anchors.leftMargin: 107
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    Rectangle {
                        id: bottomLine3
                        x: 1
                        y: 34
                        width: 178
                        height: 1
                        color: "#040404"
                    }

                    MouseArea {
                        anchors.fill: userName3
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: userName3
                        y: 9
                        width: 179
                        height: 26
                        color: "#0d0c0c"
                        anchors.left: parent.left
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        persistentSelection: false
                        selectByMouse: true
                        renderType: Text.QtRendering
                        passwordCharacter: "\u25cf"
                        mouseSelectionMode: TextInput.SelectWords
                        activeFocusOnPress: true
                        selectionColor: "#3d85ac"
                        overwriteMode: false
                        maximumLength: 32767
                        autoScroll: true
                        cursorVisible: false
                        clip: true
                        anchors.leftMargin: 0
                        selectedTextColor: "#b9bdc1"
                        validator: RegExpValidator {
                            regExp: /[0-9A-Za-z]+/
                        }
                    }
                }
                anchors.horizontalCenterOffset: 0
            }

            Rectangle {
                id: rectangle3
                x: 148
                width: 313
                height: 49
                color: "#00b98e8e"
                anchors.top: parent.top
                anchors.topMargin: 156
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text3
                    text: qsTr("Question")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 228
                    anchors.leftMargin: -2
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }

                Rectangle {
                    color: "#00000000"
                    border.color: "#00000000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 30
                    anchors.leftMargin: 107
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    Rectangle {
                        id: bottomLine2
                        x: 1
                        y: 34
                        width: 178
                        height: 1
                        color: "#040404"
                    }

                    MouseArea {
                        anchors.fill: userName2
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: userName2
                        y: 9
                        width: 179
                        height: 26
                        color: "#0d0c0c"
                        anchors.left: parent.left
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        persistentSelection: false
                        selectByMouse: true
                        renderType: Text.QtRendering
                        passwordCharacter: "\u25cf"
                        mouseSelectionMode: TextInput.SelectWords
                        activeFocusOnPress: true
                        selectionColor: "#3d85ac"
                        overwriteMode: false
                        maximumLength: 32767
                        autoScroll: true
                        cursorVisible: false
                        clip: true
                        selectedTextColor: "#b9bdc1"
                        anchors.leftMargin: 0
                        validator: RegExpValidator {
                            regExp: /[0-9A-Za-z]+/
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle2
                x: 148
                width: 313
                height: 49
                color: "#00b98e8e"
                anchors.top: parent.top
                anchors.topMargin: 102
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: text2
                    text: qsTr("Password")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 228
                    anchors.leftMargin: -1
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }

                Rectangle {
                    color: "#00000000"
                    border.color: "#00000000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 30
                    anchors.leftMargin: 107
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    Rectangle {
                        id: bottomLine1
                        x: 1
                        y: 34
                        width: 178
                        height: 1
                        color: "#040404"
                    }

                    MouseArea {
                        anchors.fill: userName1
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: userName1
                        y: 9
                        width: 179
                        height: 26
                        color: "#0d0c0c"
                        anchors.left: parent.left
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        persistentSelection: false
                        selectByMouse: true
                        renderType: Text.QtRendering
                        passwordCharacter: "\u25cf"
                        mouseSelectionMode: TextInput.SelectWords
                        activeFocusOnPress: true
                        selectionColor: "#3d85ac"
                        overwriteMode: false
                        maximumLength: 32767
                        autoScroll: true
                        cursorVisible: false
                        clip: true
                        selectedTextColor: "#b9bdc1"
                        anchors.leftMargin: 0
                        validator: RegExpValidator {
                            regExp: /[0-9A-Za-z]+/
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle1
                x: 8
                width: 313
                height: 49
                color: "#00b98e8e"
                anchors.top: parent.top
                anchors.topMargin: 47
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: text1
                    text: qsTr("UserName")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 232
                    anchors.leftMargin: 0
                    anchors.bottomMargin: -9
                    anchors.topMargin: -8
                }

                Rectangle {
                    color: "#00000000"
                    border.color: "#00000000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 30
                    anchors.leftMargin: 107
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    Rectangle {
                        id: bottomLine
                        x: 1
                        y: 34
                        width: 178
                        height: 1
                        color: "#040404"
                    }

                    MouseArea {
                        anchors.fill: userName
                        cursorShape: Qt.IBeamCursor
                    }

                    TextInput {
                        id: userName
                        y: 9
                        width: 179
                        height: 26
                        color: "#0d0c0c"
                        anchors.left: parent.left
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.hintingPreference: Font.PreferDefaultHinting
                        persistentSelection: false
                        selectByMouse: true
                        renderType: Text.QtRendering
                        passwordCharacter: "\u25cf"
                        mouseSelectionMode: TextInput.SelectWords
                        activeFocusOnPress: true
                        selectionColor: "#3d85ac"
                        overwriteMode: false
                        maximumLength: 32767
                        autoScroll: true
                        cursorVisible: false
                        clip: true
                        anchors.leftMargin: 0
                        selectedTextColor: "#b9bdc1"
                        validator: RegExpValidator {
                            regExp: /[0-9A-Za-z]+/
                        }
                    }
                }
            }




        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4}D{i:3}D{i:5}D{i:12}D{i:19}D{i:27}D{i:28}
D{i:26}
}
##^##*/
