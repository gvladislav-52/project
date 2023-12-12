import QtQuick 2.0

Rectangle {
    color: "white"
    width: 200
    height: 200

    Image {
        source: "qrc:/ui/thunder.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 15
        width: parent.width * 0.15
        height: parent.height * 0.5
        anchors.top: parent.top
    }

    Rectangle {
        color: "black"
        width: parent.width
        height: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Image {
        id: battery
        source: "qrc:/ui/battery.png"
        anchors.right: parent.right
        width: parent.width * 0.15
        height: parent.height * 0.25
        anchors.bottomMargin: 10
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
    }

    Text {
        id: redittext
        text:  qsTr("100%");
        color: "black"
        font.bold: true
        font.pixelSize: parent.width * 0.04
        anchors.right: battery.left
        anchors.verticalCenter: battery.verticalCenter
        anchors.rightMargin: 5
    }

    Text {
        text: qsTr("Charging Complete:")
        color: "black"
        font.bold: true
        font.pixelSize: parent.width * 0.04
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.bottomMargin: 12
    }
}



