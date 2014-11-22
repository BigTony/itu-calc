import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script
Rectangle {
    id: outArea
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
    Rectangle{
    id: innerArea
    parent: outArea
    Component.onCompleted: {
    var component = Qt.createComponent("Line.qml");
    Script.addLine(component.createObject(outArea));
    var component1 = Qt.createComponent("MathObj.qml");
    Script.addObj(component1.createObject(Script.getLine(0)));
    }

    }
}
