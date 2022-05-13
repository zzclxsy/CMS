import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
Item {
    id: root
    state: "hide"
    signal goHomeClicked()
    property point deltaPos: "0,0"  //定义一个点
    Rectangle {
        id: mainRect
        color: "#0d335d"
        anchors.fill: parent

        MouseArea{
            anchors.fill: mainRect
            property point clickPos: "0,0"  //定义一个点
            onPressed: {
                clickPos = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {
                deltaPos = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            }

        }

        Rectangle {
            id: gohomeRect
            x: 0
            y: 0
            width: 27
            height: 27
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
