import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script
Rectangle {
    id: outArea
    function addUni(uni){
    var obj = Script.getObj(Script.activeObj)
    console.log(obj.p)   }
    function test(){
        Script.getLine(0).y=100;
    }
    function addObject(obj){

    }
    function delActive(){}
    function setActive(x,y){}
    function addLine(){}
    width: 500
    height: 500
    x: 0
    color: "white"
    border.width: 2
    anchors.top: parent.verticalCenter
    anchors.topMargin: -330
    anchors.right: parent.horizontalCenter
    anchors.rightMargin: -512

    radius: 20

    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#dcf4ff"
        }
    }



    Rectangle{
    id: innerArea
    parent: outArea
    function compute(){return(Script.getLine(0).height);
            }
    Component.onCompleted: {
    var component = Qt.createComponent("Line.qml");
    Script.addLine(component.createObject(outArea));
    var component1 = Qt.createComponent("MathObj.qml");
    Script.addObj(component1.createObject(Script.getLine(0)));
    Script.addObj(component1.createObject(Script.getLine(0)));
    Script.getObj(0).parent=Script.getLine(0)
    Script.getObj(0).parent=Script.getLine(0)
        Script.getObj(1).parent=Script.getLine(0)
        Script.getObj(Script.activeObj).color="green"
    }
    }
}

