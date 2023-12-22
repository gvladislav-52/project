// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls

Row {
    id: containerRow

    property var mapSource
    property real fontSize : 14
    property color labelBackground : "transparent"
    property int edge: Qt.RightEdge
    property alias expanded: sliderToggler.checked

    function rightEdge() {
        return (containerRow.edge === Qt.RightEdge);
    }

    layoutDirection: rightEdge() ? Qt.LeftToRight : Qt.RightToLeft
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: rightEdge() ? parent.right : undefined
    anchors.left: rightEdge() ? undefined : parent.left

    ToolButton {
        id: sliderToggler
        contentItem: Image {
            source: "qrc:/ui/menu.png"
            fillMode: Image.PreserveAspectFit
        }
        width: 56
        height: 56
        checkable: true
        anchors.top: parent.verticalCenter
        anchors.topMargin: -parent.height *0.45

    }

    Rectangle {
        id: sliderContainer
        height: parent.height/2
        width: sliderRow.width*1.5
        visible: sliderToggler.checked
        color: "white"//Qt.rgba( 0, 191 / 255.0, 255 / 255.0, 0.07)
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -parent.height *0.05
        radius: 10
        border.color: "lightgray"
        border.width: 4
        //property var labelBorderColor: "red"
        property var slidersHeight : sliderContainer.height

            Row {
                id: sliderRow
                height: sliderContainer.slidersHeight-40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.09
                spacing: parent.width/5

                Slider {
                    id: zoomSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    value : containerRow.mapSource.zoomLevel
                    from : containerRow.mapSource.minimumZoomLevel
                    to : containerRow.mapSource.maximumZoomLevel
                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_zoomSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: zoomSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_zoomSlider
                        x: zoomSlider.leftPadding + zoomSlider.availableWidth / 2 - width / 2
                        y: zoomSlider.topPadding + zoomSlider.visualPosition * (zoomSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: zoomSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                    }

                    onValueChanged: {
                        containerRow.mapSource.zoomLevel = value
                    }
                }

                // Slider {
                //     id: bearingSlider
                //     height: parent.height
                //     from: 0
                //     to: 360
                //     orientation : Qt.Vertical
                //     value: containerRow.mapSource.bearing
                //     onValueChanged: {
                //         containerRow.mapSource.bearing = value;
                //     }
                // }

                Slider {
                    id: bearingSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    value: containerRow.mapSource.bearing
                    from: 0
                    to: 360

                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_bearingSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: bearingSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_bearingSlider
                        x: bearingSlider.leftPadding + bearingSlider.availableWidth / 2 - width / 2
                        y: bearingSlider.topPadding + bearingSlider.visualPosition * (bearingSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: bearingSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                    }

                    onValueChanged: {
                        containerRow.mapSource.bearing = value;
                    }
                }


                // Slider {
                //     id: tiltSlider
                //     height: parent.height
                //     orientation : Qt.Vertical
                //     from: containerRow.mapSource.minimumTilt;
                //     to: containerRow.mapSource.maximumTilt
                //     value: containerRow.mapSource.tilt
                //     onValueChanged: {
                //         containerRow.mapSource.tilt = value;
                //     }

                // }

                Slider {
                    id: tiltSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    from: containerRow.mapSource.minimumTilt;
                    to: containerRow.mapSource.maximumTilt
                    value: containerRow.mapSource.tilt

                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_tiltSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: tiltSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_tiltSlider
                        x: tiltSlider.leftPadding + tiltSlider.availableWidth / 2 - width / 2
                        y: tiltSlider.topPadding + tiltSlider.visualPosition * (tiltSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: tiltSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                    }

                    onValueChanged: {
                        containerRow.mapSource.tilt = value;
                    }
                }

            //} // Row sliders

            // // The labels row
            // Row {
            //     id: rowSliderLabels
            //     spacing: sliderRow.spacing
            //     width: sliderRow.width
            //     property real entryWidth: zoomSlider.width
            //     property real entryHeight: 64

            //     Rectangle{
            //         color: labelBackground
            //         height: parent.entryHeight
            //         width: parent.entryWidth
            //         border.color: sliderContainer.labelBorderColor
            //         Label {
            //             id: labelZoom
            //             text: "Zoom"
            //             font.pixelSize: fontSize
            //             rotation: -90
            //             anchors.centerIn: parent
            //         }
            //     }

            //     Rectangle{
            //         color: labelBackground
            //         height: parent.entryHeight
            //         width: parent.entryWidth
            //         border.color: sliderContainer.labelBorderColor
            //         Label {
            //             id: labelBearing
            //             text: "Bearing"
            //             font.pixelSize: fontSize
            //             rotation: -90
            //             anchors.centerIn: parent
            //         }
            //     }
            //     Rectangle{
            //         color: labelBackground
            //         height: parent.entryHeight
            //         width: parent.entryWidth
            //         border.color: sliderContainer.labelBorderColor
            //         Label {
            //             id: labelTilt
            //             text: "Tilt"
            //             font.pixelSize: fontSize
            //             rotation: -90
            //             anchors.centerIn: parent
            //         }
            //     }
            //     Rectangle{
            //         color: labelBackground
            //         height: parent.entryHeight
            //         width: parent.entryWidth
            //         border.color: sliderContainer.labelBorderColor
            //         Label {
            //             id: labelFov
            //             text: "FoV"
            //             font.pixelSize: fontSize
            //             rotation: -90
            //             anchors.centerIn: parent
            //         }
            //     }
            // } // rowSliderLabels
        } // Column
    } // sliderContainer
} // containerRow
