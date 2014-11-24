import QtQuick 2.2
import QtQuick.Controls 1.1
import "myarray.js" as Script



Rectangle {
    border.color: "black"
    border.width: 1
    property color gradcolor_o: "#ffffff"
    property color gradcolor2_o: "#98dcff"
    property color gradcolor: "#ffffff"
    property color gradcolor2: "#98dcff"
    property bool man: false
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
    function setP(x){
        p=x
    }


    function addIndex (index){}
    function delIndex (index){}
    function reDraw(){}

    function insertText(text){

    }
    function makeSymbol(symbol){

    }


            Text{
                state: "RELEASED"
                property bool man: false
                verticalAlignment: Text.AlignVCenter
 //               horizontalAlignment: Text.AlignHCenter
                font.family: "Cambria Math"
                property bool resizable: true
                font.pixelSize: 20
                id: textfi
                width:15
                function resize(){
                textfi.width=paintedWidth
                textfi.height=paintedHeight
                Script.resize(textfi)
                targetArea.anchors.fill=textfi
                }

                MouseArea{
                property bool man: false
                id:targetArea
                function setAct(){
                    Script.getManager(targetArea).setActive(parent.parent.p)
                    Script.getManager(targetArea).
                    console.log("Active obj changet from" +Script.getManager(targetArea).getActive() + " to " + parent.parent.p)
                }

                anchors.fill: parent
                onPressed: {
                    setAct()
                     mainExpr.state = "PRESSED"
                     mainExpr.gradcolor = mainExpr.gradcolor2_o
                    mainExpr.gradcolor2 = mainExpr.gradcolor_o

                }
                onEntered: {
                    mainExpr.state = "HOVER"
                    mainExpr.gradcolor = "#d3f0ff"
                    mainExpr.gradcolor2 = "#61c9ff"
                }
                }

                states: [
                         State {
                             name: "PRESSED"
                             PropertyChanges { target: mainExpr; color: "blue";   }
                         },
                         State {
                             name: "RELEASED"
                             PropertyChanges { target: mainExpr; color: "#0198be"; }
                         },
                        State {
                            name: "HOVER"
                            PropertyChanges { target: mainExpr; border.color: "#066fff";  /*opacity: 0.8*/}
                        }
                ]
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

        gradient: Gradient {
            id: grad1
            GradientStop {
                position: 0
                color: mainExpr.gradcolor
            }

            GradientStop {
                position: 1
                color: mainExpr.gradcolor2
            }
        }
}

