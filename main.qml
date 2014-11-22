import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "myarray.js" as Script

ApplicationWindow {
    visible: true
    width: 1024
    height: 680
    title: qsTr("Hello World")
    id: mainWin

    property string theme: "" // basic


       menuBar: MenuBar {
           Menu {
               title: qsTr("File")
               MenuItem {
                   text: qsTr("Exit")
                   onTriggered: Qt.quit();
               }

               MenuSeparator { }

           }
           Menu {
               title: "Změna stylu"
               MenuItem {
                   text: qsTr("Original")
                   onTriggered: theme = ""
               }
               MenuItem {
                   text: qsTr("Hellou Kitty")
                   onTriggered: theme = "2.png"
               }
               MenuItem {
                   text: qsTr("das")
                   onTriggered: theme = "3.png"
               }
               MenuItem {
                   text: qsTr("das")
                   onTriggered: theme = "4.png"
               }
               MenuItem {
                   text: qsTr("das")
                   onTriggered: theme = "5.png"
               }
           }
       }



    property int activeGrid: 0

    /*
      Funkce pro zmenu nastaveni viditelnosti gridu pro vyber operaci
      vola se u kazdeho kliknuti na button v gridu, pokud je to button
      pro zmenu operaci tak se zmeni viditelnost gridu.
      @switchOp = bool jestli menime grid nebo ne
      @gridNumber = cislo gridu ktery nastavujeme na viditelny
      */
    function switchGrids(switchOp,gridNumber){
        if(switchOp){
            gridViews[activeGrid].state = "FADE"
            gridViews[gridNumber].visible = true
            gridViews[gridNumber].state = "SHOW"
//            gridViews[activeGrid].visible = false
//            gridViews[gridNumber].visible = true
            activeGrid = gridNumber
            btnBack.visible=true
            return 1
        }
        return 0
    }

    /*
      Funkce pro zkratky, podle dane zkratky bud meni aktivni grid
      nebo aktivuje dany button pro danou operaci
      @shortCut = string zkratka ktera byla zmacknuta
      */
    function findModelShortCut(shortCut){
        var c = 0
        var elementCount = gridViews[activeGrid].model.count
        while(c <= elementCount){
            if(gridViews[activeGrid].model.get(c).name == shortCut){
                if(switchGrids(gridViews[activeGrid].model.get(c).switchOp,gridViews[activeGrid].model.get(c).gridNumber)){
                    return
                }else if(gridViews[activeGrid].model.get(c).special){
                    console.log("unicode")
                    console.log(textObject.toString())
                }else{
                    console.log(textObject.toString())
                }
                return
            }else
                c++
        }
    }




Rectangle{
    anchors.fill: parent
    id: mainRect


    //TODO: STYLY ZDE
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#bee07b"
        }
    }
/*    Image {
        anchors.fill: parent
        //width: 130; height: 100
        smooth: true
        source: "qrc:///bg/"+theme
    }

*/
    // TODO: aktivovat animace na buttonec
    Keys.onPressed: {
        if (event.key == Qt.Key_Q) {
            console.log('Key q was pressed');
//            console.log(gridView1.count)
//            gridView1.moveCurrentIndexDown()
//            console.log(gridView1.currentItem.)
//            console.log(gridView1.currentIndex)
//            gridView1.model.get(4).color = "red"
//            gridViews[activeGrid].model.get(0).colorCode = "red"
            gridView1.currentItem.focus = true
           console.log(gridViews[activeGrid].model.get(0).colorCode)

            findModelShortCut("q")
            event.accepted = true;
        }else if (event.key == Qt.Key_W) {
            console.log('Key w was pressed');
            findModelShortCut("w")
            event.accepted = true;
        }else if (event.key == Qt.Key_E) {
            console.log('Key e was pressed');
            findModelShortCut("e")
            event.accepted = true;
        }else if (event.key == Qt.Key_A) {
            console.log('Key e was pressed');
            findModelShortCut("a")
            event.accepted = true;
        }else if (event.key == Qt.Key_S) {
            console.log('Key e was pressed');
            findModelShortCut("s")
            event.accepted = true;
        }else if (event.key == Qt.Key_D) {
            console.log('Key e was pressed');
            findModelShortCut("d")
            event.accepted = true;
        }else if (event.key == Qt.Key_Z) {
            console.log('Key e was pressed');
            findModelShortCut("z")
            event.accepted = true;
        }else if (event.key == Qt.Key_X) {
            console.log('Key e was pressed');
            findModelShortCut("x")
            event.accepted = true;
        }else if (event.key == Qt.Key_C) {
            console.log('Key e was pressed');
            findModelShortCut("c")
            event.accepted = true;
        // zpet na main grid
       // jako Back button
       // TODO: aktivovat animaci
        }else if (event.key == Qt.Key_B) {
            console.log('Key b was pressed');
            switchGrids(1,0)
            btnBack.visible = false
            event.accepted = true;
        }else if ((event.key == Qt.Key_1) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+1 wass pressed');
            findModelShortCut("Ctrl+1")
            event.accepted = true;
        }else if ((event.key == Qt.Key_2) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+2 was pressed');
            findModelShortCut("Ctrl+2")
            event.accepted = true;
        }else if ((event.key == Qt.Key_3) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+3 was pressed');
            findModelShortCut("Ctrl+3")
            event.accepted = true;
        }else if ((event.key == Qt.Key_4) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+4 was pressed');
            findModelShortCut("Ctrl+4")
            event.accepted = true;
        }
    }


    ObjManager{}

    Button {
        id: btnBack
        x: gridView1.x
       // y: 10
        text: qsTr("Zpět")
        visible: false
        width: 64
        height: 32

        MouseArea{
            anchors.fill: parent
            onClicked: {
                switchGrids(1,0)
                btnBack.visible = false
            }
            onEntered: btnBack.opacity = 0.7
            onExited: btnBack.opacity = 1
            hoverEnabled: true         //this line will enable mouseArea.containsMouse
        }
        style: ButtonStyle {

          label: Text {
            //renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 12
            color: "black"
            text: control.text
          }

          background: Rectangle {
              id: tt1
              //implicitWidth: 100
              //implicitHeight: 25
              border.width: 0
              radius: 4
              color:  "lightsteelblue"
              opacity: 1

          }
        }


    }
}


ListModel {
    id:zaklOp
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        textObject: "+"
        labelObject: "+"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "\u2212"
        textObject: "\u2212"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "\u00D7"
        textObject: "\u00D7"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "\u00F7"
        textObject: "\u00F7"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: ","
        textObject: ","
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: "="
        textObject: "="
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "y"
        labelObject: "("
        textObject: "("
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "x"
        labelObject: ")"
        textObject: ")"
        special: false
    }

    ListElement{
        colorCode: "grey"
        name: "c"
        labelObject: "\u00B1"
        textObject: "\u00B1"
        special: false
    }
}

ListModel {
    id:integraly
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        labelObject: "\u222B"
        textObject: "\u222B"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "\u222C"
        textObject: "\u222C"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "\u222E"
        textObject: "\u222E"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "\u222F"
        textObject: "\u222F"
        special: true
    }
}

ListModel {
    id:logaritmy
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        labelObject: "log"
        textObject: "log"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "ln"
        textObject: "ln"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "sin"
        textObject: "sin"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "cos"
        textObject: "cos"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: "tan"
        textObject: "tan"
        special: true
    }
    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: "cotg"
        textObject: "cotg"
        special: true
    }
}



ListModel {
    id:ostatni
    ListElement{
        colorCode: "grey"
        name: "q"
        labelObject: "\u03A0"
        textObject: "\u03A0"
        switchOp: false
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "\u00BD"
        textObject: "\u00BD"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "\u221A"
        textObject: "\u221A"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "\u221B"
        textObject: "\u221B"
        special: false
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: "\u03A3"
        textObject: "\u03A3"
        special: false
    }

}

    ListModel {
            id:mainMenu
            ListElement{
                switchOp: true
                name: "Ctrl+1"
                colorCode: "#09c300"
                textObject: "1"
                labelObject: "+\u2212\u00D7\u00F7"
                gridNumber: 1
            }

            ListElement{
                switchOp: true
                name: "Ctrl+2"
                colorCode: "#09c300"
                textObject: "2"
                labelObject: "\u2A1B"
                gridNumber: 2
            }

            ListElement{
                switchOp: true
                name: "Ctrl+3"
                colorCode: "#09c300"
                textObject: "3"
                labelObject: "log"
                gridNumber: 3
            }

            ListElement{
                switchOp: true
                name: "Ctrl+4"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: "Více"
                gridNumber: 4
            }

            ListElement {
                name: "q"
                colorCode: "grey"
                textObject: "1"
                labelObject: "1"
                special: false
            }

            ListElement {
                name: "w"
                colorCode: "grey"
                textObject: "2"
                labelObject: "2"
                special: false
            }

            ListElement {
                name: "e"
                colorCode: "grey"
                textObject: "3"
                labelObject: "3"
                special: false
            }

            ListElement {
                name: "a"
                colorCode: "grey"
                textObject: "4"
                labelObject: "4"
                special: false
            }

            ListElement {
                name: "s"
                colorCode: "grey"
                textObject: "5"
                labelObject: "5"
                special: false
            }

            ListElement {
                name: "d"
                colorCode: "grey"
                textObject: "6"
                labelObject: "6"
                special: false
            }

            ListElement {
                name: "z"
                colorCode: "grey"
                textObject: "7"
                labelObject: "7"
                special: false
            }

            ListElement {
                name: "x"
                colorCode: "grey"
                textObject: "8"
                labelObject: "8"
                special: false
            }

            ListElement {
                name: "c"
                colorCode: "grey"
                textObject: "9"
                labelObject: "9"
                special: false
            }
        }

     Component {
            id: menuDelegate

            Column {
                id: columnId
                x: 40
                Rectangle {
                    id: buttonObject
                    state: "RELEASED"
                    width: 90
                    height: 90
                    color: colorCode
                    border.color: "black"
                    border.width: 2
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: labelObjectText
                        anchors.centerIn: parent
                        text: labelObject
                        font.bold: true
                        font.family: "Cambria Math"
                        font.pointSize: 20
                    }

                    MouseArea{
                        hoverEnabled: true
                        id: mouseAreaGridView1
                        anchors.fill: parent
                        onPressed: buttonObject.state = "PRESSED"
                        onReleased: buttonObject.state = "RELEASED"
                        onEntered: buttonObject.state = "HOVER"
                        onExited: buttonObject.state = "RELEASED"
                        onClicked: {
                            if(switchOp){
                                switchGrids(switchOp,gridNumber)
                            }else if(textObject.special){
                                console.log("unicode")
                                console.log(textObject.toString())
                            }else{
                                console.log(textObject.toString())
                            }


                        }
                    }

                    Keys.onPressed: {
                             console.log(buttonObject.state)
                    }

                    PropertyChanges {
                        target: buttonObject
                        explicit: true
                        color: "red"
                        border.width: 10
                    }


                    states: [
                             State {
                                 name: "PRESSED"
                                 PropertyChanges { target: buttonObject; color: "blue"; radius: 10  }
                             },
                             State {
                                 name: "RELEASED"
                                 PropertyChanges { target: buttonObject; color: "#0198be"; radius: 10}
                             },
                            State {
                                name: "HOVER"
                                PropertyChanges { target: buttonObject; border.color: "red"; radius: 10; opacity: 0.8}
                            }
                    ]

                    transitions: [
                             Transition {
                                 from: "PRESSED"
                                 to: "RELEASED"
                                 ColorAnimation { target: buttonObject; duration: 100}
                             },
                             Transition {
                                 from: "RELEASED"
                                 to: "PRESSED"
                                 ColorAnimation { target: buttonObject; duration: 100}
                             }
                    ]

                }

                Text {
                    x: 5
                    text: name
                    font.bold: true
                    width: 90
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    font.pointSize: 12
                }

                spacing: 5
            }
        }

     function testLog(){
         console.log("test")
     }

    property list<GridView> gridViews: [
         GridView {
             parent: mainRect
             model:mainMenu
             delegate: menuDelegate
             focus: true

             state: "SHOW"
             id: gridView1
             visible: true
             x: 46
             y: 40
             width: 400
             height: 640
             cellHeight: 160
             cellWidth: 100

             states: [
                 State {
                     name: "FADE"
                     PropertyChanges {target: gridView1; scale: 0.1; opacity: 0}
                },
                 State {
                     name: "SHOW"
                     PropertyChanges {target: gridView1; scale: 1; opacity: 1}
                 }

             ]

             transitions: [
                 Transition {
                    PropertyAnimation {properties: "opacity,scale"; easing.type: Easing.InOutQuad}
                 }
             ]
         },

         GridView {
                   parent: mainRect
                   model:zaklOp
                   delegate: menuDelegate
                   focus: true

                   visible: false
                   id: zaklOpGrid
                   x: 46
                   y: 40
                   width: 400
                   height: 640
                   cellHeight: 160
                   cellWidth: 100
                   state: "FADE"
                   scale: 0.1
                   opacity: 0

                   states: [
                       State {
                           name: "FADE"
                           PropertyChanges {target: zaklOpGrid; scale: 0.1; opacity: 0}
                      },
                       State {
                           name: "SHOW"
                           PropertyChanges {target: zaklOpGrid; scale: 1; opacity: 1}
                       }

                   ]

                   transitions: [
                       Transition {
                          PropertyAnimation {properties: "opacity,scale"; easing.type: Easing.InOutQuad}
                       }
                   ]
         },

         GridView {
             parent: mainRect
             model:integraly
             delegate: menuDelegate
             focus: true

           visible: false
          id: integralyGrid
          x: 46
          y: 40
          width: 400
          height: 640
          cellHeight: 160
          cellWidth: 100
          state: "FADE"
          scale: 0.1
          opacity: 0

          states: [
              State {
                  name: "FADE"
                  PropertyChanges {target: integralyGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: integralyGrid; scale: 1; opacity: 1}
              }

          ]

          transitions: [
              Transition {
                 PropertyAnimation {properties: "opacity,scale"; easing.type: Easing.InOutQuad}
              }
          ]
         },

         GridView {
             parent: mainRect
             model:logaritmy
             delegate: menuDelegate
             focus: true

           visible: false
          id: logaritmyGrid
          x: 46
          y: 40
          width: 400
          height: 640
          cellHeight: 160
          cellWidth: 100
          state: "FADE"
          scale: 0.1
          opacity: 0

          states: [
              State {
                  name: "FADE"
                  PropertyChanges {target: logaritmyGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: logaritmyGrid; scale: 1; opacity: 1}
              }

          ]

          transitions: [
              Transition {
                 PropertyAnimation {properties: "opacity,scale"; easing.type: Easing.InOutQuad}
              }
          ]
         },

         GridView {
             parent: mainRect
             model:ostatni
             delegate: menuDelegate
             focus: true
           visible: false
          id: ostatniGrid
          x: 46
          y: 40
          width: 400
          height: 640
          cellHeight: 160
          cellWidth: 100
          state: "FADE"
          scale: 0.1
          opacity: 0

          states: [
              State {
                  name: "FADE"
                  PropertyChanges {target: ostatniGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: ostatniGrid; scale: 1; opacity: 1}
              }

          ]

          transitions: [
              Transition {
                 PropertyAnimation {properties: "opacity,scale"; easing.type: Easing.InOutQuad}
              }
          ]
         }
   ]
}
