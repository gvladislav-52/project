import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width: 200
    height: 616

    Image {
        id: asd
        source: "qrc:/ui/carUp2.png"
        width: 200
        height: 400
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit

        Image {
            id: carImage
            source: "qrc:/ui/test.png"
            width: asd.width/5
            height: asd.height/5
            anchors.left: asd.horizontalCenter
            anchors.leftMargin: 30
            anchors.bottom: asd.verticalCenter
            anchors.bottomMargin: -23
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Top
            SequentialAnimation on rotation {
                    id: doorOpenAnimation
                    running: false
                    PropertyAnimation { target: carImage; property: "rotation"; to: -40; duration: 500 }
                }
            SequentialAnimation on rotation {
                    id: revdoorOpenAnimation
                    running: false
                    PropertyAnimation { target: carImage; property: "rotation"; to: 0; duration: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        doorOpenAnimation.running = true
                    }
                }
        }
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
        onClicked: {
            revdoorOpenAnimation.running = true
        }
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
        visible: false
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
