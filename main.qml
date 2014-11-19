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

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    Button {
        id: button1
        x: 114
        y: 335
        text: qsTr("Fucked")

        MouseArea{
            onClicked: console.log("ahoj")
        }
    }
}
