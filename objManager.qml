import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script
Rectangle {
    function addObject(type,obj){
        if (type==opr) {

        }
    }
    function delActive(){}
    function setActive(x,y){}
    function addLine(){}
    width: 500
    height: 500
    id: objectArea
    x: 0
    color: "white"
    border.width: 2
    anchors.top: parent.verticalCenter
    anchors.topMargin: -330
    anchors.right: parent.horizontalCenter
    anchors.rightMargin: -512

    Component.onCompleted: {
    var component = Qt.createComponent("MathObj.qml");
    }
}
