import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script

Column{
    property bool man: true
    anchors.top: parent.verticalCenter
    anchors.topMargin: -330
    anchors.right: parent.horizontalCenter
    anchors.rightMargin: -512
    Keys.onPressed: {
           if (event.key == Qt.Key_Left) {
                console.log("left arrow")
               prevAct()
           }else if(event.key == Qt.Key_Right){
                console.log("right arrow")
               nextAct()
           }
        }

    function setEditTexr(str){
        textedit.text=str
    }
    function nextAct(){
        Script.getObj(Script.activeObj).state="RELEASED"
        Script.nextAct()
        textedit.text=Script.getObj(Script.activeObj).getText()
        Script.getObj(Script.activeObj).state="PRESSED"
    }
    function prevAct(){
        Script.getObj(Script.activeObj).state="RELEASED"
        Script.prevAct()
        textedit.text=Script.getObj(Script.activeObj).getText()
        Script.getObj(Script.activeObj).state="PRESSED"
    }

    function setActive(a){
        Script.getObj(Script.activeObj).state="RELEASED"
        Script.activeObj=a

        Script.getObj(Script.activeObj).state="PRESSED"
    }
    function getActive(){
        return Script.activeObj
    }
    function addUni(uni){
        var obj = Script.getObj(Script.activeObj)
        var component1 = Qt.createComponent("MathObj.qml");
        Script.addObj(component1.createObject(Script.getLine(0)));
        Script.getObj(Script.activeObj).setP(Script.objArray.length-1)
         Script.getObj(Script.objArray.length-1)
        Script.getObj(Script.objArray.length-1).setP(Script.objArray.length-1)
        Script.getObj(Script.objArray.length-1).setText(uni)
    if (obj.getText()===" "){

    }
    console.log("Adding " + uni + "to object n"+Script.activeObj)
    var obj = Script.getObj(Script.activeObj)
    textedit.text=uni
    }
    function test(){
        Script.getLine(0).y=100;
    }
    function addObject(obj){
    }
    function delActive(){}
    function addLine(){}
    Rectangle {
    id: outArea
    property bool man: false
    width: 500
    height: 500
    x: 0
    color: "white"
    border.width: 2

    radius: 20
    Gradient {
        GradientStop {
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#dcf4ff"
        }
    }
}
/*
  Zde se edituje aktivni prvek
  */
TextField{
    property bool man: false
    font.pixelSize: 20
    id: textedit
    height:30
    width:500
    onEditingFinished: sendText()
    function sendText(){
            Script.getObj(Script.activeObj).setText(text)
    }
    function getText() {
           text= Script.getObj(Script.activeObj).getText()
    }


}


    Rectangle{
    id: innerArea
    property bool man: false
    parent: outArea
    function compute(){return(Script.getLine(0).height);
            }
    Component.onCompleted: {
    var component = Qt.createComponent("Line.qml");
    Script.addLine(component.createObject(outArea));
    var component1 = Qt.createComponent("MathObj.qml");
    Script.addObj(component1.createObject(Script.getLine(0)));
    Script.getObj(Script.activeObj).setP(Script.objArray.length-1)
    Script.addObj(component1.createObject(Script.getLine(0)));
    Script.getObj(1).setP(Script.objArray.length-1)
        Script.getObj(Script.activeObj).setText("1aACT")
        Script.getObj(1).setText("22222")
    }
    }

}
