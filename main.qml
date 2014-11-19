import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 1024
    height: 680
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
        width: 400
        height: 640
        cellHeight: 160
        model: ListModel {

            ListElement{
                name: "Zakladni operatory"
                colorCode: "grey"
                textObject: "1"
                labelObject: "ZkOp"
            }

            ListElement{
                name: "Integraly"
                colorCode: "grey"
                textObject: "1"
                labelObject: "Int"
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
            id: nasItem
            x: 5
            height: 50
            Column {
                Rectangle {

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
                    font.bold: true
                    width: 90
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                }

                spacing: 5
            }
        }
        cellWidth: 100
    }


}

