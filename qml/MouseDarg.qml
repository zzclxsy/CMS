import QtQuick 2.0

//      左上    上    右上（不考虑）
//      ---    ---   ---
//      左            右
//      ---    ---   ---
//      左下    下    右下
//      ---    ---   ---

MouseArea {
    id :root
    anchors.fill: parent
    hoverEnabled: true
    property var g_mousePos: ""
    property point changePos: "0,0"
    property point g_currPos: "0,0"
    property bool g_press: false
    property var operObj: null
    property bool isCanOper: true
    function calcMousePos(mousePos)
    {
        //左上
        if (mousePos.x <= 10 && mousePos.y <10)
        {
            g_mousePos = "leftTop"
            root.cursorShape = Qt.SizeFDiagCursor
        }else //上
            if (mousePos.x > 10 && mousePos.x < root.width - 10 && mousePos.y <10)
            {
                g_mousePos = "top"
                root.cursorShape = Qt.SizeVerCursor
            }else //左
                if (mousePos.x <= 10 && mousePos.y >10 && mousePos.y < root.height -10)
                {
                    g_mousePos = "left"
                    root.cursorShape = Qt.SizeHorCursor
                }else //中间
                    if (mousePos.x > 10 && mousePos.x < root.width - 10 && mousePos.y >10 && mousePos.y < root.height -10)
                    {
                        g_mousePos = "middle"
                        root.cursorShape = Qt.ArrowCursor
                    }else //左下
                        if (mousePos.x <= 10 && mousePos.y > root.height -10)
                        {
                            g_mousePos = "leftBottom"
                            root.cursorShape = Qt.SizeBDiagCursor
                        }else //下
                            if (mousePos.x > 10 && mousePos.x < root.width - 10 && mousePos.y > root.height -10)
                            {
                                g_mousePos = "bottom"
                                root.cursorShape = Qt.SizeVerCursor
                            }else //右下
                                if (mousePos.x > root.width - 10 && mousePos.y > root.height -10)
                                {
                                    g_mousePos = "rightBottom"
                                    root.cursorShape = Qt.SizeFDiagCursor
                                }else //右
                                    if (mousePos.x > root.width - 10 && mousePos.y >10 && mousePos.y < root.height -10)
                                    {
                                        g_mousePos = "right"
                                        root.cursorShape = Qt.SizeHorCursor
                                    }
    }
    property point clickPos: "0,0"
    onPressed: {
        if (isCanOper === false)
            return

        g_press = true
        clickPos = Qt.point(mouse.x,mouse.y)

    }
    onReleased: {

        if (isCanOper === false)
            return

        g_press = false
    }

    onPositionChanged: {

        if (isCanOper === false)
            return

        if (g_press)
        {
            //g_currPos必须放到changePos前面赋值，不然changePos值改变
            //会有限进入槽函数，而g_currPos则是上次的值
            g_currPos = Qt.point(mouse.x, mouse.y)
            changePos = Qt.point(mouse.x- clickPos.x, mouse.y- clickPos.y)
        }
        else
        {
            calcMousePos(mouse)
        }
    }


    onChangePosChanged: {

        if (isCanOper === false)
            return

        if (g_mousePos === "left")
        {
            operObj.setWidth(operObj.width - changePos.x)
            operObj.setX(operObj.x + changePos.x)
        }
        else if (g_mousePos === "top")
        {
            operObj.setHeight(operObj.height - changePos.y)
            operObj.setY(operObj.y + changePos.y)
        }else if (g_mousePos === "bottom")
        {
            operObj.height = (g_currPos.y)
        }else if (g_mousePos === "right")
        {
            operObj.width = (g_currPos.x)
        }
        else if (g_mousePos === "leftTop")
        {
            operObj.setWidth(operObj.width - changePos.x)
            operObj.setX(operObj.x + changePos.x)

            operObj.setHeight(operObj.height - changePos.y)
            operObj.setY(operObj.y + changePos.y)
        }
        else if (g_mousePos === "leftBottom")
        {
            operObj.setHeight(g_currPos.y)
            operObj.setWidth(operObj.width - changePos.x)
            operObj.setX(operObj.x + changePos.x)
        }
        else if (g_mousePos === "rightBottom")
        {
            operObj.width  = (g_currPos.x)
            operObj.height = (g_currPos.y)
        }
    }
}
