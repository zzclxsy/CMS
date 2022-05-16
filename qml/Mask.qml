import QtQuick 2.0
import QtQuick.Window 2.1
import QtQml 2.12
/**灯箱效果，禁止操作下层的对象*/
Rectangle {
    //anchors.fill: getRoot(this)
    color: 'lightgrey'
    opacity: 0.2
    z:99
    MouseArea{
        anchors.fill: parent;
        onPressed:{
             mouse.accepted = true
        }
    }

    function getRoot(item)
    {
        return item.parent.parent
    }


    Component.onCompleted: {
        this.parent = getRoot(this);
        this.anchors.fill = parent;
    }
}
