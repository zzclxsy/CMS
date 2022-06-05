import QtQuick 2.0
import QtQml 2.12
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.2
import "element"
Item {

    LoadPlugin{
        id:loadPlugin
        x:  (parent.width/2 -400)
        y:  (parent.height/2 -300)
        width: 800
        height:600
    }
    WaitMask{
        id:waitMask
    }
    FileDialog {
        id: fileDialog
        nameFilters: ["CMS应用程序(*.cms)"]
        onAccepted: {
            waitMask.show()
            console.log(fileDialog.fileUrl)
            var ret =PluginManager.installCMS(fileDialog.fileUrl)
            waitMask.hide()
            if (ret !== "")
            {
                var obj = JSON.parse(ret)
                console.log(obj["error"]["message"])
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        GridView {
            id: gridView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            flickableDirection: Flickable.AutoFlickIfNeeded
            keyNavigationWraps: false
            highlightFollowsCurrentItem: true
            anchors.rightMargin: 8
            anchors.bottomMargin: 0
            anchors.leftMargin: 8
            anchors.topMargin: 24
            delegate: Item {
                Column {
                    Rectangle {
                        id: cellRect
                        width: 80
                        height: 80
                        color: "#00000000"
                        anchors.horizontalCenter: parent.horizontalCenter
                        property string iconUrl: "file:///" + appdir + "/plugin/" +moduleName + "/" + urlIcon
                        Image {
                            id: maskimage
                            anchors.fill: parent
                            source: cellRect.iconUrl
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            fillMode: Image.PreserveAspectCrop
                            smooth: true
                            visible: false
                            ColorOverlay{
                                id:maskimageOverlay
                                anchors.fill: maskimage
                                source: maskimage
                                color: "#00638cba"
                            }
                        }

                        Rectangle {
                            id: rectangle3
                            anchors.fill: parent
                            color: "#ffffff"
                            radius: 10
                            border.width: 0
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: false
                            smooth: true
                        }

                        OpacityMask{
                            anchors.fill: maskimage
                            source: maskimage
                            maskSource: rectangle3
                        }

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onPressed: {
                                maskimageOverlay.color = "#80d2d3d2"
                            }
                            onReleased: {
                                maskimageOverlay.color = "#00000000"
                            }
                            onExited: {
                                maskimageOverlay.color = "#00000000"
                            }
                            onClicked: {
                                loadPlugin.setIconAndTitle(cellRect.iconUrl, aliasName)
                                loadPlugin.setPluginName(moduleName)
                                loadPlugin.show()
                            }
                        }
                    }

                    Text {
                        text: aliasName
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    spacing: 5
                }
            }

            cellWidth: 150
            cellHeight: 120
            model:PluginManager_PluginDataModel
        }

        Rectangle {
            id: rectangle1
            height: 47
            color: "#00fdfdfd"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: instBtn
                x: 522
                width: 118
                color: "#70bef5"
                radius: 6
                border.width: 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0

                Text {
                    id: text1
                    text: qsTr("安装CMS程序")
                    anchors.fill: parent
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        instBtn.color = "#5070bef5"
                    }
                    onReleased: {
                        instBtn.color = "#70bef5"
                    }
                    onClicked: {
                        fileDialog.open()
                    }
                }
            }

            Rectangle {
                id: rectangle2
                height: 1
                color: "#c4bfbf"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 53
                anchors.rightMargin: 0
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:17}
}
##^##*/
