import QtQuick 2.0
import "element/"
Popup{

    id: popup
    focus: true
    visible: false
    animationType:"size"
    showMask: false

    function setIconAndTitle(url, titleName)
    {
        win.title = titleName;
        win.icon = url
    }

    function setPluginName(moduleName)
    {
        var path = "file:///" + appdir +"/plugin/"+moduleName + "/" + "main.qml"
        win.content = path

        popup.width = 800
        popup.height = 600

        popup.innerX = (popup.parent.width / 2 - width / 2);
        popup.innerY = (popup.parent.height / 2 - height / 2);
    }
    MouseDarg{
        id:drag
        anchors.fill: parent
        operObj: parent
        onChangePosChanged: {
            if (g_mousePos !== "right" && g_mousePos !== "bottom" && g_mousePos !== "rightBottom")
            {
                popup.x =  popup.x + drag.changePos.x
                popup.y =  popup.y + drag.changePos.y
            }
        }
    }

    DialogWin{
        id:win
        anchors.fill:parent
        onCloseWin: {
            popup.hide();
        }
    }

}
