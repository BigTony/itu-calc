import QtQuick 2.2
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
    Rectangle {
        id: leftTopIndex


    }
    Rectangle {
        id: leftBotIndex

    }
    Rectangle {
        id: rightTopIndex

    }
    Rectangle {
        id: rightBotIndex

    }
    Rectangle{
        x: 0
        y: 0
        width:20
        height:20
        color:"blue"
    }
}

