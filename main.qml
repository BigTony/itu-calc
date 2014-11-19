import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }


    GridView {
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Q) {
                    console.log('Key q was pressed');
                    event.accepted = true;
            }
        }

        id: gridView1
        x: 46
        y: 28
        width: 228
        height: 417
        cellHeight: 70
        model: ListModel {

            ListElement{
                name: "Zakladni operatory"
                colorCode: "grey"
                textObject: "1"
                labelObject: "ZkOp"
            }

            ListElement {
                name: "One"
                colorCode: "grey"
                textObject: "1"
                labelObject: "1"
            }

            ListElement {
                name: "Two"
                colorCode: "grey"
                textObject: "2"
                labelObject: "2"
            }

            ListElement {
                name: "Three"
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
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {

                    width: 50
                    height: 50
                    color: colorCode
                    border.color: "black"
                    border.width: 2
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: labelObjectText
                        anchors.centerIn: parent
                        text: labelObject
                        font.bold: true
                    }

                    MouseArea{
                        id: mouseAreaGridView1
                        anchors.fill: parent
                        onClicked: console.log(textObject)
                    }
                }

                Text {
                    x: 5
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }

                spacing: 5
            }
        }
        cellWidth: 70
    }
}

