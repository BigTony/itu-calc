import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script

Rectangle {
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
        id: leftTopIndex
    }

    Rectangle {
        id: rightTopIndex
    }
    Rectangle{
        id:exp
        width:20
        height:20
        color:"blue"
        TextField{
            id: textfi
            function omg(){ width=textfi.text.lenght*9
            console.log(textfi.text.lenght)}
            parent: exp
            width:15
            onEditingFinished: omg()


        }
    }
    Rectangle {
        id: rightBotIndex
    }
    Rectangle {
        id: leftBotIndex
    }

}

