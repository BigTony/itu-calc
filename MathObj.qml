import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script

Rectangle {
    property bool resizable: true
    property int p: 0
    id: expression
    color: "red"
    width: 60
    height: 20
    property string objType
    function addIndex (index){}
    function delIndex (index){}
    function reDraw(){}

    Rectangle {
        property bool resizable: true
        id: leftTopIndex
    }

    Rectangle {
        property bool resizable: true
        id: rightTopIndex
    }
    Rectangle{
        property bool resizable: true
        id:exp
        width:20
        height:20
        color:"blue"
        TextField{
            property bool resizable: true
            font.pixelSize: 15
            id: textfi
            parent: exp
            width:15
            onEditingFinished: resize()
            function resize(){
            width=8+text.length*8
            Script.resize(textfi)
            }
        }
    }
    Rectangle {
        property bool resizable: true
        id: rightBotIndex
    }
    Rectangle {
        property bool resizable: true
        id: leftBotIndex
    }

}

