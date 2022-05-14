import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
Popup{

    id: popup
    anchors.centerIn: parent
    width: 300
    height: 350
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape
    property int g_affirm: 0
    property int g_close: 1
    property int g_cancel: 2

    property var g_callback

    function showBtn(closeBtnShow, cancelBtnShow)
    {
        var length = 100
        if (closeBtnShow)
        {
            length = 210
            cancelBtnShow = false
        }
        else if (cancelBtnShow)
        {
            length = 210
            closeBtnShow = false
        }

        row.width = length
        closeBtn.visible = closeBtnShow
        cancelBtn.visible = cancelBtnShow
    }

    function warnMessage(info, callback, closeBtnShow = false,cancelBtnShow = false)
    {
        if (callback === undefined)
            callback = ()=>{}

        showBtn(closeBtnShow, cancelBtnShow)
        infoIcomImage.source="qrc:/image/warn.svg"
        infoInput.text = info
        g_callback = callback
        popup.open()
    }

    function informMessage(info, callback, closeBtnShow = false,cancelBtnShow = false)
    {
        if (callback === undefined)
            callback = ()=>{}

        showBtn(closeBtnShow, cancelBtnShow)
        infoIcomImage.source = "qrc:/image/info.svg"
        infoInput.text = info
        g_callback = callback
        popup.open()

    }

    function errorMessage(info, callback, closeBtnShow = false,cancelBtnShow = false)
    {
        if (callback === undefined)
            callback = ()=>{}

        showBtn(closeBtnShow, cancelBtnShow)
        infoIcomImage.source = "qrc:/image/errorInfo.svg"
        infoInput.text = info
        g_callback = callback
        popup.open()
    }

    contentItem: Rectangle{
        id: rectangle1
        width: 348
        color: "#165194"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            x: 0
            y: 42
            width: 300
            height: 86
            color: "#00165194"

            Image {
                id: infoIcomImage
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: ""
                anchors.rightMargin: 111
                anchors.leftMargin: 101
                anchors.bottomMargin: 3
                anchors.topMargin: 9
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle2
            x: 0
            y: 0
            width: 300
            height: 42
            color: "#00165194"
            border.width: 0
            Rectangle {
                id: closeRect
                x: 270
                y: 0
                width: 25
                height: 25
                color: "#00ffffff"
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 1

                Image {
                    id: image1
                    width: 17
                    anchors.fill: parent
                    source: "qrc:/image/close.svg"
                    fillMode: Image.PreserveAspectFit
                    ColorOverlay{
                        id:closeColor
                        anchors.fill: image1
                        source: image1
                        color: "#a6bcc3"
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            closeColor.color="#e1453c"
                        }
                        onExited: {
                            closeColor.color="#a6bcc3"
                        }
                        onPressed: {
                            closeColor.color = "#e58a84"
                        }

                        onClicked: {
                            g_callback(g_cancel)
                            close()
                        }
                    }
                }
            }
        }

        Text {
            id: infoInput
            x: 0
            y: 159
            width: 300
            height: 83
            color: "#fdfdfd"
            text: qsTr("wrong password")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            clip:true
        }
        Row {
            id: row
            x: 29
            y: 275
            width: 211
            height: 40
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Rectangle {
                id: affirmBtn
                color: "#00ffffff"
                border.color: "#80d6e0f1"
                border.width: 1
                x:0
                width: 100
                height: 40
                Text {
                    id: text4
                    color: "#ffffff"
                    text: qsTr("Affirm")
                    anchors.fill: parent
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    hoverEnabled: true
                    property bool m_isEnter: false
                    anchors.fill: parent
                    onEntered: {
                        m_isEnter = true
                        affirmBtn.border.color= "#d6e0f1"
                     }
                    onExited: {
                        m_isEnter = false
                        affirmBtn.border.color= "#80d6e0f1"
                    }
                    onPressed: {
                        affirmBtn.border.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            affirmBtn.border.color="#d6e0f1"
                    }

                    onClicked: {
                            console.log("affirmBtn")
                            g_callback(g_affirm)
                            close()
                    }
                }

            }


            Rectangle {
                id: closeBtn
                color: "#00ffffff"
                border.color: "#80d6e0f1"
                border.width: 1
                x:110
                width: 100
                height: 40
                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr("Close")
                    anchors.fill: parent
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    hoverEnabled: true
                    property bool m_isEnter: false
                    anchors.fill: parent
                    onEntered: {
                        m_isEnter = true
                        closeBtn.border.color= "#d6e0f1"
                    }
                    onExited: {
                        m_isEnter = false
                        closeBtn.border.color= "#80d6e0f1"
                    }
                    onPressed: {
                        closeBtn.border.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            closeBtn.border.color="#d6e0f1"
                    }

                    onClicked: {
                            console.log("closeBtn")
                            g_callback(g_close)
                            close()
                    }
                }
            }

            Rectangle {
                id: cancelBtn
                color: "#00ffffff"
                border.color: "#80d6e0f1"
                border.width: 1
                visible: false
                x:110
                width: 100
                height: 40
                Text {
                    id: text2
                    color: "#ffffff"
                    text: qsTr("Cancel")
                    anchors.fill: parent
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    hoverEnabled: true
                    property bool m_isEnter: false
                    anchors.fill: parent
                    onEntered: {
                        m_isEnter = true
                        cancelBtn.border.color= "#d6e0f1"
                    }
                    onExited: {
                        m_isEnter = false
                        cancelBtn.border.color= "#80d6e0f1"
                    }
                    onPressed: {
                        cancelBtn.border.color="#5097ee"
                    }
                    onReleased: {
                        if (m_isEnter == true)
                            cancelBtn.border.color="#d6e0f1"
                    }

                    onClicked: {
                            console.log("cancelBtn")
                            g_callback(g_cancel)
                            close()
                    }
                }


            }



        }

    }


}
