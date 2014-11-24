import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script



Rectangle {


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


    function addIndex (index){}
    function delIndex (index){}
    function reDraw(){}

    function insertText(text){

    }
    function makeSymbol(symbol){

    }


            Text{
                verticalAlignment: Text.AlignVCenter
 //               horizontalAlignment: Text.AlignHCenter
                font.family: "Cambria Math"
                property bool resizable: true
                font.pixelSize: 20
                id: textfi
                width:15
                text:"Test"
                function resize(){
                width=15+text.length*8
                Script.resize(textfi)
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

