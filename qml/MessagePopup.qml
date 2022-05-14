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

    function warnMessage(info)
    {
        row.width = 210
        closeBtn.visible = false
        cancelBtn.visible = true
        infoInput.text = info
        popup.open()
        console.log("ddddd")
    }

    function informMessage(info)
    {
        row.width = 100
        closeBtn.visible = false
        cancelBtn.visible = false
        infoInput.text = info
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
                id: image
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "qrc:/image/warn.svg"
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
                border.color: "#49a8fa"
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
            }


            Rectangle {
                id: closeBtn
                color: "#00ffffff"
                border.color: "#49a8fa"
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
            }

            Rectangle {
                id: cancelBtn
                color: "#00ffffff"
                border.color: "#49a8fa"
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
            }



        }

    }


}
