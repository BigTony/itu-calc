import QtQuick 2.0

Rectangle {
    function addObject(obj){}
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
        for (var i=0; i<1; i++) {
            var object = component.createObject(objectArea);
                    Script.addItem(object);
                     (Script.getList()[i]).x = ((Script.getList()[i]).width + 10) * i;
                 }}
}
