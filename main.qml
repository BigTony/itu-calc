import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    visible: true
    width: 1024
    height: 680
    title: qsTr("Hello World")
    id: mainWin

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

     /*
       Udrzuje hodnotu aktivniho gridu pro vyber operaci
       */
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
            gridViews[activeGrid].visible = false
            gridViews[gridNumber].visible = true
            activeGrid = textObject
        }
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
                switchGrids(gridViews[activeGrid].model.get(c).switchOp,gridViews[activeGrid].model.get(c).gridNumber)
               console.log(gridViews[activeGrid].model.get(c).textObject)
                return
            }else
                c++
        }
    }


Rectangle{
    anchors.fill: parent
    id: mainRect
    // TODO: aktivovat animace na buttonec
    Keys.onPressed: {
        if (event.key == Qt.Key_Q) {
            console.log('Key q was pressed');
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
            gridViews[activeGrid].visible = false
            gridViews[0].visible = true
            activeGrid = 0
            event.accepted = true;
        }else if ((event.key == Qt.Key_1) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+1 wass pressed');
            findModelShortCut("Ctrl+1")
            event.accepted = true;
        }else if ((event.key == Qt.Key_2) && (event.modifiers & Qt.ControlModifier)){
            console.log('Key Ctrl+2 was pressed');
            findModelShortCut("Ctrl+2")
            event.accepted = true;
        }
    }

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
                gridViews[activeGrid].visible = false
                gridViews[0].visible = true
                activeGrid = 0
                btnBack.visible = false
            }
            hoverEnabled: true         //this line will enable mouseArea.containsMouse
            onEntered: {
                //console.log(tt1);
            }
        }
        style: ButtonStyle {

          label: Text {
            //renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: 12
            color: "blue"
            text: control.text
          }

          background: Rectangle {
              id: tt1
              //implicitWidth: 100
              //implicitHeight: 25
              border.width: 0
              radius: 4
              color:  "lightsteelblue"
              opacity: 0.3
          }
        }
    }
}

    ListModel {
        id:zaklOp
        ListElement{
            name: "zaklOp"
            colorCode: "grey"
            textObject: "zaklOp"
            labelObject: "zaklOp"
        }
    }

    ListModel {
        id:integraly
        ListElement{
            name: "Integral"
            colorCode: "grey"
            textObject: "integral"
            labelObject: "Int"
        }
   }

    ListModel {
        id:logaritmy
        ListElement{
            name: "Logaritmus"
            colorCode: "grey"
            textObject: "logaritmus"
            labelObject: "Log"
        }
    }



    ListModel {
            id:mainMenu
            ListElement{
                switchOp: true
                name: "Zakladni operatory"
                colorCode: "grey"
                textObject: "1"
                labelObject: "\u2A1B"
                gridNumber: 1
            }

            ListElement{
                switchOp: true
                name: "Integraly"
                colorCode: "grey"
                textObject: "2"
                labelObject: "Int"
                gridNumber: 2
            }

            ListElement{
                switchOp: true
                name: "Logarimy and shit"
                colorCode: "grey"
                textObject: "3"
                labelObject: "log"
                gridNumber: 3
            }

            ListElement{
                name: "Dal"
                colorCode: "grey"
                //textObject: "4"
                labelObject: "MS"
                //gridNumber: 4
            }

            ListElement {
                name: "q"
                colorCode: "grey"
                textObject: "1"
                labelObject: "1"
            }

            ListElement {
                name: "w"
                colorCode: "grey"
                textObject: "2"
                labelObject: "2"
            }

            ListElement {
                name: "e"
                colorCode: "grey"
                textObject: "3"
                labelObject: "3"
            }

            ListElement {
                name: "a"
                colorCode: "grey"
                textObject: "4"
                labelObject: "4"
            }

            ListElement {
                name: "s"
                colorCode: "grey"
                textObject: "5"
                labelObject: "5"
            }

            ListElement {
                name: "d"
                colorCode: "grey"
                textObject: "6"
                labelObject: "6"
            }

            ListElement {
                name: "z"
                colorCode: "grey"
                textObject: "7"
                labelObject: "7"
            }

            ListElement {
                name: "x"
                colorCode: "grey"
                textObject: "8"
                labelObject: "8"
            }

            ListElement {
                name: "c"
                colorCode: "grey"
                textObject: "9"
                labelObject: "9"
            }
        }

     Component {
            id: menuDelegate
            Column {
                id: columnId
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
                        id: mouseAreaGridView1
                        anchors.fill: parent
                        onPressed: buttonObject.state = "PRESSED"
                        onReleased: buttonObject.state = "RELEASED"
                        onClicked: {
                            //switchGrids(switchOp,gridNumber)
                            gridViews[activeGrid].visible = false
                            gridViews[gridNumber].visible = true
                            activeGrid = textObject
                            btnBack.visible=true
                            console.log(textObject)
                        }
                    }

                    states: [
                             State {
                                 name: "PRESSED"
                                 PropertyChanges { target: buttonObject; color: "blue"}
                             },
                             State {
                                 name: "RELEASED"
                                 PropertyChanges { target: buttonObject; color: "grey"}
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

    property list<GridView> gridViews: [
         GridView {
             parent: mainRect
             model:mainMenu
             delegate: menuDelegate
             focus: true
             Keys.onPressed: {
                 if (event.key == Qt.Key_Q) {
                         console.log('Key q was pressed');
                         event.accepted = true;
                 }
             }

             id: gridView1
             visible: true
             x: 46
             y: 40
             width: 400
             height: 640
             cellHeight: 160
             cellWidth: 100
         },

         GridView {
                   parent: mainRect
                   model:zaklOp
                   delegate: menuDelegate
                   focus: true
                   Keys.onPressed: {
                          if (event.key == Qt.Key_Q) {
                              console.log('Key q was pressed');
                              event.accepted = true;
                          }
                   }
                   visible: false
                   id: zaklOpGrid
                   x: 46
                   y: 40
                   width: 400
                   height: 640
                   cellHeight: 160
                   cellWidth: 100
         },

         GridView {
             parent: mainRect
             model:integraly
             delegate: menuDelegate
             focus: true
             Keys.onPressed: {
                 if (event.key == Qt.Key_Q) {
                     console.log('Key q was pressed');
                     event.accepted = true;
                 }
             }
           visible: false
          id: integralyGrid
          x: 46
          y: 40
          width: 400
          height: 640
          cellHeight: 160
          cellWidth: 100
         },

         GridView {
             parent: mainRect
             model:logaritmy
             delegate: menuDelegate
             focus: true
             Keys.onPressed: {
                 if (event.key == Qt.Key_Q) {
                     console.log('Key q was pressed');
                     event.accepted = true;
                 }
             }
           visible: false
          id: logaritmyGrid
          x: 46
          y: 40
          width: 400
          height: 640
          cellHeight: 160
          cellWidth: 100
         }
   ]
}
