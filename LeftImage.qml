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
            id: rightDoor
            source: "qrc:/ui/test.png"
            width: asd.width/5
            height: asd.height/5.5
            anchors.left: asd.horizontalCenter
            anchors.leftMargin: 31
            anchors.bottom: asd.verticalCenter
            anchors.bottomMargin: -18
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Top
            SequentialAnimation on rotation {
                    id: doorOpenAnimationRight
                    running: false
                    PropertyAnimation { target: rightDoor; property: "rotation"; to: -40; duration: 500 }
                }
            SequentialAnimation on rotation {
                    id: revdoorOpenAnimationRight
                    running: false
                    PropertyAnimation { target: rightDoor; property: "rotation"; to: 0; duration: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        doorOpenAnimationRight.running = true
                    }
                }
        }

        Image {
            id: leftDoor
            source: "qrc:/ui/leftDoor.png"
            width: asd.width/5
            height: asd.height/5.5
            anchors.right: asd.horizontalCenter
            anchors.rightMargin: 39
            anchors.bottom: asd.verticalCenter
            anchors.bottomMargin: -18
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Top
            SequentialAnimation on rotation {
                    id: doorOpenAnimationLeft
                    running: false
                    PropertyAnimation { target: leftDoor; property: "rotation"; to: 40; duration: 500 }
                }
            SequentialAnimation on rotation {
                    id: revdoorOpenAnimationLeft
                    running: false
                    PropertyAnimation { target: leftDoor; property: "rotation"; to: 0; duration: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        doorOpenAnimationLeft.running = true
                    }
                }
        }

        Image {
            id: leftDoorBottom
            source: "qrc:/ui/LeftDoorBottom.png"
            width: asd.width/5
            height: asd.height/5.5
            anchors.right: asd.horizontalCenter
            anchors.rightMargin: 34
            anchors.top: asd.verticalCenter
            anchors.topMargin: 10
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Top
            SequentialAnimation on rotation {
                    id: doorOpenAnimationLeftBottom
                    running: false
                    PropertyAnimation { target: leftDoorBottom; property: "rotation"; to: 40; duration: 500 }
                }
            SequentialAnimation on rotation {
                    id: revdoorOpenAnimationLeftBottom
                    running: false
                    PropertyAnimation { target: leftDoorBottom; property: "rotation"; to: 0; duration: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        doorOpenAnimationLeftBottom.running = true
                    }
                }
        }

        Image {
            id: rightDoorBottom
            source: "qrc:/ui/RightDoorBottom.png"
            width: asd.width/5
            height: asd.height/5.5
            anchors.left: asd.horizontalCenter
            anchors.leftMargin: 27
            anchors.top: asd.verticalCenter
            anchors.topMargin: 10
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Top
            SequentialAnimation on rotation {
                    id: doorOpenAnimationRightBottom
                    running: false
                    PropertyAnimation { target: rightDoorBottom; property: "rotation"; to: -40; duration: 500 }
                }
            SequentialAnimation on rotation {
                    id: revdoorOpenAnimationRightBottom
                    running: false
                    PropertyAnimation { target: rightDoorBottom; property: "rotation"; to: 0; duration: 500 }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        doorOpenAnimationRightBottom.running = true
                    }
                }
        }

        Image
        {
            id: closeCapot
            source: "qrc:/ui/CapotClose.png"
            width: asd.width/2
            height: asd.height/2
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: -54
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 2
            visible: true
        }

        Image
        {
            id: openCapot
            source: "qrc:/ui/CapotOpen.png"
            width: asd.width/2
            height: asd.height/2
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: -54
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: -5
            visible: false
        }

        Image
        {
            id: closeBag
            source: "qrc:/ui/CloseBag.png"
            width: asd.width/2.3
            height: asd.height/2.3
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: -48
            anchors.top: parent.verticalCenter
            anchors.topMargin: 24
            visible: true
        }

        Image
        {
            id: openBag
            source: "qrc:/ui/OpenBag.png"
            width: asd.width/2.3
            height: asd.height/2.3
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: -48
            anchors.top: parent.verticalCenter
            anchors.topMargin: 12
            visible: false

        }
    }


    Button
    {
        text: "Bottom"
        width: parent.width * 0.35
        height: parent.height * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -30
        opacity: 0.5
        onClicked: {
            revdoorOpenAnimationRight.running = true
            revdoorOpenAnimationLeft.running = true
            revdoorOpenAnimationLeftBottom.running = true
            revdoorOpenAnimationRightBottom.running = true
            closeCapot.visible = !closeCapot.visible
            openCapot.visible = !openCapot.visible
            closeBag.visible = !closeBag.visible
            openBag.visible = !openBag.visible
        }
    }

    // Button
    // {
    //     text: "Top"
    //     width: parent.width * 0.45
    //     height: parent.height * 0.25
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: parent.top
    //     anchors.topMargin: 20
    //     opacity: 0.5
    // }

    // Button {
    //     text: "LeftUp"
    //     width: parent.width * 0.175
    //     height: parent.height * 0.2
    //     anchors.right: parent.horizontalCenter
    //     anchors.bottom: parent.verticalCenter
    //     anchors.rightMargin: 40
    //     anchors.bottomMargin: -20
    //     opacity: 0.5
    //     visible: false
    // }

    // Button {
    //     text: "RightUp"
    //     visible: false
    //     width: parent.width * 0.175
    //     height: parent.height * 0.2
    //     anchors.left: parent.horizontalCenter
    //     anchors.bottom: parent.verticalCenter
    //     anchors.leftMargin: 40
    //     anchors.bottomMargin: -20
    //     opacity: 0.5
    // }

    // Button {
    //     text: "LeftDown"
    //     width: parent.width * 0.175
    //     height: parent.height * 0.2
    //     anchors.right: parent.horizontalCenter
    //     anchors.top: parent.verticalCenter
    //     anchors.rightMargin: 40
    //     anchors.topMargin: 20
    //     opacity: 0.5
    // }

    // Button {
    //     text: "RightDown"
    //     width: parent.width * 0.175
    //     height: parent.height * 0.2
    //     anchors.left: parent.horizontalCenter
    //     anchors.top: parent.verticalCenter
    //     anchors.leftMargin: 40
    //     anchors.topMargin: 20
    //     opacity: 0.5
    // }
}
