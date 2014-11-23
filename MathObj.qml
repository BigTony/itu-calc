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
    function addIndex (index){}
    function delIndex (index){}
    function reDraw(){}

    function getShit(){
        console.log( "timeout: " + loader.item.width )
        return
    }

    Component {
            id: comp1
            Rectangle {
                property bool resizable: true
                id:expr
                width:20
                height:20
                color:"blue"
                TextField{
                    property bool resizable: true
                    font.pixelSize: 15
                    id: textfi
                    width:15
        //            onEditingFinished: resize()
                    function resize(){
                    width=15+text.length*8
                    Script.resize(textfi)
                    }
                }
            }
        }

        Loader {
            id: loader
            sourceComponent: comp1
        }

//        property load: loader
//        Component.onCompleted: load = loader

//        Component.onCompleted: console.log("yolo")


//        Component.onCompleted: console.log( "timeout: " + loader.item.width )

        Rectangle{
            property bool resizable: true
            id:expr
            width:20
            height:20
            color:"blue"
            TextField{
                property bool resizable: true
                font.pixelSize: 15
                id: textfi
                width:15
    //            onEditingFinished: resize()
                function resize(){
                width=15+text.length*8
                Script.resize(textfi)
                }
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

