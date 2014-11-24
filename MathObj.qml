import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script



Rectangle {

    property bool man: false
    property bool resizable: true
    property int p: 0
    color: "red"
    width: 60
    height: 20
    id: mainExpr
    property string objType
    function setText(texts) {
        textfi.text=texts
        textfi.resize()
    }
    function getText(){
        return textfi.text
    }
    function setP(x){
        p=x
    }


    function addIndex (index){}
    function delIndex (index){}
    function reDraw(){}

    function insertText(text){

    }
    function makeSymbol(symbol){

    }


            Text{
                property bool man: false
                verticalAlignment: Text.AlignVCenter
 //               horizontalAlignment: Text.AlignHCenter
                font.family: "Cambria Math"
                property bool resizable: true
                font.pixelSize: 20
                id: textfi
                width:15
                function resize(){
                textfi.width=paintedWidth
                textfi.height=paintedHeight
                Script.resize(textfi)
                targetArea.anchors.fill=textfi
                }
                MouseArea{
                property bool man: false
                id:targetArea
                function setAct(){
                    Script.getManager(targetArea).setActive(parent.parent.p)
                    console.log("Active obj changet from" +Script.getManager(targetArea).getActive() + " to " + parent.parent.p)
                }

                anchors.fill: parent
                onEntered:setAct()
                }
            }

//        Component.onCompleted: console.log( "timeout: " +expr.width )

        Rectangle {
            property bool resizable: true
            id: rightBotIndex
        }
        Rectangle {
            property bool resizable: true
            id: leftBotIndex
        }
        Rectangle {
            property bool resizable: true
            id: leftTopIndex
        }

        Rectangle {
            property bool resizable: true
            id: rightTopIndex
        }


}

