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

    property string theme: "bg1.jpg" // basic


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
                   onTriggered: theme = "bg1.jpg"
               }
               MenuItem {
                   text: qsTr("Vzorek")
                   onTriggered: theme = "bg2.jpg"
               }
               MenuItem {
                   text: qsTr("Hello Kitty")
                   onTriggered: theme = "bg3.jpg"
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
        if(switchOp && (gridNumber < 7)){
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
                    console.log(gridViews[activeGrid].model.get(c).textObject.toString())
                }else{
                    console.log(gridViews[activeGrid].model.get(c).textObject.toString())
                }
                return
            }else
                c++
        }
    }




Rectangle{
    anchors.fill: parent
    id: mainRect

//    MouseArea {
//            id: shortCutMouseArea
//            anchors.fill: parent
//            onClicked: {
//                console.log("MainMouseArea")
//            }
//    }


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
    Image {
        anchors.fill: parent
        //width: 130; height: 100
        smooth: true
        source: "qrc:///bg/"+theme
    }


    // TODO: aktivovat animace na buttonec
    Keys.onPressed: {
        if (event.key == Qt.Key_Q) {
//           console.log( positionViewAtIndex(3,gridViews[activeGrid].Beginning).x)
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
            manager.test();
            console.log('Key w was pressed');
            findModelShortCut("w")

            event.accepted = true;
        }else if (event.key == Qt.Key_E) {
            console.log('Key e was pressed');
            findModelShortCut("e")
            event.accepted = true;
        }else if (event.key == Qt.Key_R) {
            console.log('Key r was pressed');
            findModelShortCut("r")
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
        }else if (event.key == Qt.Key_F) {
            console.log('Key f was pressed');
            findModelShortCut("f")
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
        }else if (event.key == Qt.Key_V) {
            console.log('Key v was pressed');
            findModelShortCut("v")
            event.accepted = true;
        }else if (event.key == Qt.Key_Space) {
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


    ObjManager{id:manager}

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
    id:numbers
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        textObject: "1"
        labelObject: "1"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "w"
        textObject: "2"
        labelObject: "2"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "e"
        textObject: "3"
        labelObject: "3"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "r"
        textObject: "4"
        labelObject: "4"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "a"
        textObject: "5"
        labelObject: "5"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "s"
        textObject: "6"
        labelObject: "6"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "d"
        textObject: "7"
        labelObject: "7"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "f"
        textObject: "8"
        labelObject: "8"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "z"
        textObject: "9"
        labelObject: "9"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "x"
        textObject: "0"
        labelObject: "0"
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "c"
        textObject: "."
        labelObject: "."
        special: false
        bg: "n"
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
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "\u2212"
        textObject: "\u2212"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "\u00D7"
        textObject: "\u00D7"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "r"
        labelObject: "\u00F7"
        textObject: "\u00F7"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: ">"
        textObject: ">"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: "<"
        textObject: "<"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: "="
        textObject: "="
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "f"
        labelObject: "\u00AC"
        textObject: "\u00AC"
        special: false
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "z"
        labelObject: "\u00B1"
        textObject: "\u00B1"
        special: false
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "x"
        labelObject: "\u2205"
        textObject: "\u2205"
        special: false
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "c"
        labelObject: "\u2264"
        textObject: "\u2264"
        special: false
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "v"
        labelObject: "\u2265"
        textObject: "\u2265"
        special: false
        bg: "n"
    }
}

ListModel {
    id:integraly
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        labelObject: "\u222B \u25A1"
        textObject: "\u222B \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "w"
        labelObject: "\u222B"
        textObject: "\u222B"
        special: true
        bg: "../icons/9.png"
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "\u222C \u25A1"
        textObject: "\u222C \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "r"
        labelObject: "\u222C"
        textObject: "\u222C"
        special: true
        bg: "../icons/9.png"
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "\u222D \u25A1"
        textObject: "\u222D \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: "\u222D"
        textObject: "\u222D"
        special: true
        bg: "../icons/9.png"
    }
    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: "\u222E \u25A1"
        textObject: "\u222E \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "f"
        labelObject: "\u222E"
        textObject: "\u222E"
        special: true
        bg: "../icons/9.png"
    }
    ListElement{
        colorCode: "grey"
        name: "z"
        labelObject: "\u222F \u25A1"
        textObject: "\u222F \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "x"
        labelObject: "\u222F"
        textObject: "\u222F"
        special: true
        bg: "../icons/9.png"
    }
    ListElement{
        colorCode: "grey"
        name: "c"
        labelObject: "\u2230 \u25A1"
        textObject: "\u2230 \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "v"
        labelObject: "\u2230"
        textObject: "\u2230"
        special: true
        bg: "../icons/9.png"
    }
}

ListModel {
    id:logaritmy
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        labelObject: "sin \u25A1"
        textObject: "sin \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: "cos \u25A1"
        textObject: "cos \u25A1"
        special: false
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: "tan \u25A1"
        textObject: "tan \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "r"
        labelObject: "cot \u25A1"
        textObject: "cot \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: "sec \u25A1"
        textObject: "sec \u25A1"
        special: true
        bg: "n"
    }
    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: "csc \u25A1"
        textObject: "csc \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: "sinh \u25A1"
        textObject: "sinh \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "f"
        labelObject: "cosh \u25A1"
        textObject: "cosh \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "z"
        labelObject: "tanh \u25A1"
        textObject: "tanh \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "x"
        labelObject: "csch \u25A1"
        textObject: "csch \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "c"
        labelObject: "sech \u25A1"
        textObject: "sech \u25A1"
        special: true
        bg: "n"
    }

    ListElement{
        colorCode: "grey"
        name: "v"
        labelObject: "coth \u25A1"
        textObject: "coth \u25A1"
        special: true
        bg: "n"
    }
}

ListModel {
    id:mocodmoc
    ListElement{
        colorCode: "grey"
        name: "q"
        labelObject: " "
        textObject: "../icons/1.png"
        switchOp: false
        bg: "../icons/1.png"
    }

    ListElement{
        colorCode: "grey"
        name: "w"
        labelObject: " "
        textObject: "../icons/2.png"
        switchOp: false
        bg: "../icons/2.png"
    }

    ListElement{
        colorCode: "grey"
        name: "e"
        labelObject: " "
        textObject: "../icons/3.png"
        switchOp: false
        bg: "../icons/3.png"
    }

    ListElement{
        colorCode: "grey"
        name: "r"
        labelObject: " "
        textObject: "../icons/4.png"
        switchOp: false
        bg: "../icons/4.png"
    }

    ListElement{
        colorCode: "grey"
        name: "a"
        labelObject: " "
        textObject: "../icons/5.png"
        switchOp: false
        bg: "../icons/5.png"
    }

    ListElement{
        colorCode: "grey"
        name: "s"
        labelObject: " "
        textObject: "../icons/6.png"
        switchOp: false
        bg: "../icons/6.png"
    }

    ListElement{
        colorCode: "grey"
        name: "d"
        labelObject: " "
        textObject: "../icons/7.png"
        switchOp: false
        bg: "../icons/7.png"
    }

    ListElement{
        colorCode: "grey"
        name: "f"
        labelObject: " "
        textObject: "../icons/8.png"
        switchOp: false
        bg: "../icons/8.png"
    }

}

ListModel {
    id: zavorky
    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "q"
        labelObject: "("
        textObject: "("
        special: false
        bg: "n"
    }

    ListElement{
        switchOp: false
        colorCode: "grey"
        name: "w"
        labelObject: ")"
        textObject: ")"
        special: false
        bg: "n"
    }

    ListElement{
            switchOp: false
            colorCode: "grey"
            name: "e"
            labelObject: "["
            textObject: "]"
            special: false
            bg: "n"
        }

    ListElement{
            switchOp: false
            colorCode: "grey"
            name: "r"
            labelObject: "]"
            textObject: "]"
            special: false
            bg: "n"
        }

    ListElement{
            switchOp: false
            colorCode: "grey"
            name: "a"
            labelObject: "{"
            textObject: "{"
            special: false
            bg: "n"
        }

    ListElement{
            switchOp: false
            colorCode: "grey"
            name: "s"
            labelObject: "}"
            textObject: "}"
            special: false
            bg: "n"
        }
}

//Image {
//    id: mocninaBg
//    source: "../icons/1.png"
////    x:  positionViewAtIndex(3,gridViews[activeGrid].Beginning).x
////    y: gridViews[activeGrid].currentItem.y + 100
//}


    ListModel {
            id:mainMenu
            ListElement{
                switchOp: true
                name: "q"
                colorCode: "#09c300"
                textObject: "1"
                labelObject: "+\u2212\u00D7\u00F7"
                gridNumber: 1
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "w"
                colorCode: "#09c300"
                textObject: "2"
                labelObject: "\u222B \u25A1"
                gridNumber: 2
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "e"
                colorCode: "#09c300"
                textObject: "3"
                labelObject: "sin \u25A1"
                gridNumber: 3
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "r"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: " "
                gridNumber: 4
                bg: "../icons/1.png"
            }

            ListElement{
                switchOp: true
                name: "a"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: "()[]"
                gridNumber: 5
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "s"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: "1 2 3"
                gridNumber: 6
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "d"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: "\u2211"
                gridNumber: 7
                bg: "n"
            }

            ListElement{
                switchOp: true
                name: "f"
                colorCode: "#09c300"
                textObject: "4"
                labelObject: "\u03BB \u03B5 \u03C0"
                gridNumber: 8
                bg: "n"
            }

            ListElement {
                name: "z"
                colorCode: "grey"
                textObject: "1"
                labelObject: ""
                bg: "../icons/10.png"
                special: false
                //bg: "n"
            }

            ListElement {
                name: "x"
                colorCode: "grey"
                textObject: "2"
                labelObject: ""
                special: false
                bg: "../icons/1.png"
            }

            ListElement {
                name: "c"
                colorCode: "grey"
                textObject: "3"
                labelObject: ""
                special: false
                bg: "../icons/6.png"
            }

            ListElement {
                name: "v"
                colorCode: "grey"
                textObject: "4"
                labelObject: ""
                special: false
                bg: "../icons/5.png"
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

                    Image {
                        function testBg(bcg) {
                            if(bcg !== "n"){
                                 return bcg
                            }else{
                                  mocninaBg.visible = false
                                 return "../icons/1.png"
                            }
                       }

                        id: mocninaBg
                        source: testBg(bg)
                        anchors.fill: parent
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
                            mainRect.focus = true
                            if(switchOp){
                                if(gridNumber < 7){
                                    switchGrids(switchOp,gridNumber)
                                }
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
                    //x: 5
                    text: name
                    font.bold: true
                    width: 90
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    wrapMode: Text.Wrap
                    font.pointSize: 12
                    height: 35

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        id: keyboardBg
                        source: "../icons/keyboard.png"
                        scale: 1
                        //anchors.fill: parent
                        height: parent.height
                        z: -1
                    }
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

//                 MouseArea {
//                         id: shortCutMouseArea
//                         anchors.fill: gridView1
//                         onClicked: {
//                             console.log(mainRect.focus)
//                             console.log(gridView1.focus)
//                             console.log(shortCutMouseArea.focus)
////                             mainRect.focus = true
////                             focus: false
//                         }
//                 }

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
             model:mocodmoc
             delegate: menuDelegate
             focus: true
           visible: false
          id: mocodmocGrid
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
                  PropertyChanges {target: mocodmocGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: mocodmocGrid; scale: 1; opacity: 1}
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
             model:zavorky
             delegate: menuDelegate
             focus: true
           visible: false
          id: zavorkyGrid
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
                  PropertyChanges {target: zavorkyGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: zavorkyGrid; scale: 1; opacity: 1}
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
             model:numbers
             delegate: menuDelegate
             focus: true
           visible: false
          id: numbersGrid
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
                  PropertyChanges {target: numbersGrid; scale: 0.1; opacity: 0}
             },
              State {
                  name: "SHOW"
                  PropertyChanges {target: numbersGrid; scale: 1; opacity: 1}
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

