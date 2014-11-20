import QtQuick 2.2
import QtQuick.Controls 1.1

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
        id: button1
        x: 654
        y: 60
        text: qsTr("Button")
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gridViews[activeGrid].visible = false
                gridViews[0].visible = true
                activeGrid = 0
            }
        }
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
            id:mainMenu
            ListElement{
                name: "Ctrl+1"
                colorCode: "grey"
                textObject: "1"
                labelObject: "\u2A1B"
            }

            ListElement{
                switchOp: true
                name: "Ctrl+2"
                colorCode: "grey"
                textObject: "1"
                labelObject: "Int"
                gridNumber: 1
            }

            ListElement{
                name: "Logarimy and shit"
                colorCode: "grey"
                textObject: "1"
                labelObject: "LogAshit"
            }

            ListElement{
                name: "A nejakej mega shit"
                colorCode: "grey"
                textObject: "1"
                labelObject: "MegaShit"
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
                            switchGrids(switchOp,gridNumber)
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

             id: gridView1
             visible: true
             x: 46
             y: 28
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

          visible: false
         id: integralyGrid
         x: 46
         y: 28
         width: 400
         height: 640
         cellHeight: 160
         cellWidth: 100
        }
   ]
}

