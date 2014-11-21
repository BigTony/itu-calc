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
                onTriggered: Qt.quit()
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        id: mainRect

        Button {
            id: button1
            x: 654
            y: 60
            text: qsTr("Button")
            MouseArea {
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
        id: integraly
        ListElement {
            name: "Integral"
            colorCode: "grey"
            textObject: "integral"
            labelObject: "Int"
        }
    }

    ListModel {
        id: mainMenu
        ListElement {
            name: "Zakladni operatory"
            colorCode: "grey"
            textObject: "1"
            labelObject: "\u2A1B"
        }

        ListElement {
            name: "Integraly"
            colorCode: "grey"
            textObject: "1"
            labelObject: "Int"
            gridNumber: 1
        }

        ListElement {
            name: "Logarimy and shit"
            colorCode: "grey"
            textObject: "1"
            labelObject: "LogAshit"
        }

        ListElement {
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
            name: "Four"
            colorCode: "grey"
            textObject: "4"
            labelObject: "4"
        }

        ListElement {
            name: "Green"
            colorCode: "grey"
            textObject: "5"
            labelObject: "5"
        }

        ListElement {
            name: "Green"
            colorCode: "grey"
            textObject: "6"
            labelObject: "6"
        }

        ListElement {
            name: "Green"
            colorCode: "grey"
            textObject: "7"
            labelObject: "7"
        }

        ListElement {
            name: "Green"
            colorCode: "grey"
            textObject: "8"
            labelObject: "8"
        }

        ListElement {
            name: "Green"
            colorCode: "grey"
            textObject: "9"
            labelObject: "9"
        }
    }

    Component {
        id: menuDelegate

        Column {
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

                MouseArea {
                    id: mouseAreaGridView1
                    anchors.fill: parent
                    onPressed: buttonObject.state = "PRESSED"
                    onReleased: buttonObject.state = "RELEASED"
                    onClicked: {
                        if (!activeGrid) {
                            gridViews[activeGrid].visible = false
                            gridViews[gridNumber].visible = true
                            activeGrid = textObject
                        }
                        console.log(textObject)
                    }
                }

                states: [
                    State {
                        name: "PRESSED"
                        PropertyChanges {
                            target: buttonObject
                            color: "blue"
                        }
                    },
                    State {
                        name: "RELEASED"
                        PropertyChanges {
                            target: buttonObject
                            color: "grey"
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: "PRESSED"
                        to: "RELEASED"
                        ColorAnimation {
                            target: buttonObject
                            duration: 100
                        }
                    },
                    Transition {
                        from: "RELEASED"
                        to: "PRESSED"
                        ColorAnimation {
                            target: buttonObject
                            duration: 100
                        }
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

    property int activeGrid: 0
    property list<GridView> gridViews: [

                                           GridView {
                                               parent: mainRect
                                               model: mainMenu
                                               delegate: menuDelegate
                                               focus: true
                                               Keys.onPressed: {
                                                   if (event.key == Qt.Key_Q) {
                                                       console.log('Key q was pressed')
                                                       event.accepted = true
                                                   }
                                               }

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
                                               model: integraly
                                               delegate: menuDelegate
                                               focus: true
                                               Keys.onPressed: {
                                                   if (event.key == Qt.Key_Q) {
                                                       console.log('Key q was pressed')
                                                       event.accepted = true
                                                   }
                                               }
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
