import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width: 200
    height: 616

    Image {
        source: "qrc:/ui/carUp2.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    Button
    {
        text: "Bottom"
        width: parent.width * 0.35
        height: parent.height * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        opacity: 0.5
    }

    Button
    {
        text: "Top"
        width: parent.width * 0.45
        height: parent.height * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        opacity: 0.5
    }

    Button {
        text: "LeftUp"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.rightMargin: 40
        anchors.bottomMargin: -20
        opacity: 0.5
    }

    Button {
        text: "RightUp"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.left: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.leftMargin: 40
        anchors.bottomMargin: -20
        opacity: 0.5
    }

    Button {
        text: "LeftDown"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.rightMargin: 40
        anchors.topMargin: 20
        opacity: 0.5
    }

    Button {
        text: "RightDown"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.left: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.leftMargin: 40
        anchors.topMargin: 20
        opacity: 0.5
    }
}
