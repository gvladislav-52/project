// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

//! [imports]
import QtQuick
import QtQuick.Window
//! [imports]

//! [0]
Rectangle {
    property var temp_tahometr: 1
    color: "#1f1f1f"
    //! [the dial in use]
    // Dial with a slider to adjust it
    Dial {
        id: dial
        anchors.centerIn: parent
        value: slider.x * 100 / (container.width - 32)
    }
    //! [the dial in use]

    Rectangle {
        id: container
        property int oldWidth: 0
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 20; rightMargin: 20
            bottomMargin: 10
        }
        height: 16

        radius: 8
        opacity: 0.7
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }

        onWidthChanged: {
            if (oldWidth === 0) {
                oldWidth = width;
                return
            }

            let desiredPercent = slider.x * 100 / (oldWidth - 32)
            slider.x = desiredPercent * (width - 32) / 100
            oldWidth = width
        }

        Rectangle {
            id: slider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            antialiasing: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent; drag.axis: Drag.XAxis
                drag.minimumX: 2; drag.maximumX: container.width - 32
            }
        }
    }

    Image {
        id: image_distance
        source: "qrc:/ui/distance.png"
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.05
        anchors.top: parent.verticalCenter
        anchors.topMargin: parent.height *0.12
        width: parent.width*0.08
        height: parent.height*0.05
    }

    Text {
        id: text_distance
        anchors.left: image_distance.left
        anchors.leftMargin: parent.width * 0.1
        anchors.verticalCenter: image_distance.verticalCenter
        font.pixelSize: image_distance.height * 0.5
        font.bold: true
        color: "white"
        topPadding: -parent.height * 0.03
        text: "180" + " km"
    }

    Text {
        id: text_distance_static
        anchors.left: image_distance.left
        anchors.leftMargin: parent.width*0.1
        anchors.top: text_distance.bottom
        text: "Distance"
        font.pixelSize: image_distance.height*0.35
        font.bold: true
        color: "white"
    }
}
//! [0]
