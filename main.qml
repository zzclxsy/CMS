import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import QtQuick.Controls 2.5

Window {
    id: root
    width: 925
    height: 450
    flags: Qt.Window | Qt.FramelessWindowHint //隐藏标题栏
    visible: true
    title: qsTr("Hello World")

    Loader{
        id:registerLoader
        anchors.fill: parent
        source : "Register.qml"
    }

    Loader{
        id:pageLoader
        anchors.fill: parent
        source: "Login.qml"
    }

    //login 信号
    Connections{
        target: pageLoader.item
        onCloseLogin: {
            close();
        }
        onDeltaPosChanged:{
            root.setX(root.x + pageLoader.item.deltaPos.x )
            root.setY(root.y + pageLoader.item.deltaPos.y)
        }
        onRegisterClicked:
        {
            pageLoader.item.state = "hide"
            registerLoader.item.state = "normal"
        }
    }
    //Register信号
    Connections{
        target: registerLoader.item
        onDeltaPosChanged:{
            root.setX(root.x + registerLoader.item.deltaPos.x )
            root.setY(root.y + registerLoader.item.deltaPos.y)
        }
        onGoHomeClicked:
        {
            registerLoader.item.state = "hide";
            pageLoader.item.state = "normal"
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:1}
}
##^##*/
