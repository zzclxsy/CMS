import QtQuick 2.12
import QtQuick.Window 2.2
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
        id:forgetLoader
        anchors.fill: parent
        source : "ForgetPassword.qml"
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
            registerLoader.item.clearPageData()
        }
        onForgetClicked:{
            pageLoader.item.state = "hide"
            forgetLoader.item.state = "normal"
            forgetLoader.item.clearPageData()
        }
        onLoginSucceed:{
            pageLoader.source = "qrc:/qml/OperationUI.qml"
            forgetLoader.source = ""
            registerLoader.source = ""
            root.width = 1300
            root.height = 800
            root.setX(Screen.width / 2 - width / 2);
            root.setY(Screen.height / 2 - height / 2);


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
    Connections{
        target: forgetLoader.item
        onDeltaPosChanged:{
            root.setX(root.x + forgetLoader.item.deltaPos.x )
            root.setY(root.y + forgetLoader.item.deltaPos.y)
        }
        onGoHomeClicked:
        {
            forgetLoader.item.state = "hide";
            pageLoader.item.state = "normal"
        }
    }

    Component.onCompleted: {
        pageLoader.item.forgetClicked.connect(forgetLoader.item.getUserName)
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}D{i:1}
}
##^##*/
