// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

//! [Imports]
import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls

//! [Imports]

Rectangle {
    anchors.fill: parent

    //! [Initialize Plugin]
    Plugin {
        id: myPlugin
        name: "osm"
        //specify plugin parameters if necessary
        //PluginParameter {...}
        //PluginParameter {...}
        //...
    }
    //! [Initialize Plugin]

    //! [Current Location]
    PositionSource {
        id: positionSource
        property variant lastSearchPosition: QtPositioning.coordinate(56.307706, 43.984085) //Initialized/Fallback to Oslo
        active: true
        updateInterval: 120000 // 2 mins
        onPositionChanged:  {
            var distance = lastSearchPosition.distanceTo(position.coordinate)
            if (distance > 500) {
                // 500m from last performed food search
                lastSearchPosition = positionSource.position.coordinate
            }
        }
    }
    //! [Current Location]

    //! [PlaceSearchModel]
    PlaceSearchModel {
        id: searchModel

        plugin: myPlugin

        searchTerm: "school"
        searchArea:  QtPositioning.circle(positionSource.lastSearchPosition, 1000 /* 1 km radius */)
        Component.onCompleted: update()
    }
    //! [PlaceSearchModel]

    //! [Places MapItemView]
    MapView {
        id: view
        anchors.fill: parent
        map.plugin: myPlugin;
        map.center: positionSource.lastSearchPosition
        map.zoomLevel: 13

        MapItemView {
            model: searchModel
            parent: view.map
            delegate: MapQuickItem {
                coordinate: place.location.coordinate

                anchorPoint.x: image.width * 0.5
                anchorPoint.y: image.height

                sourceItem: Column {
                    Image { id: image; source: "qrc:/ui/marker.png" }
                    Text { text: title; font.bold: true }
                }
            }
        }
    }
    //! [Places MapItemView]

    Connections {
        target: searchModel
        function onStatusChanged() {
            if (searchModel.status == PlaceSearchModel.Error)
                console.log(searchModel.errorString());
        }
    }

    RoundButton {
        //text: "-"
        id: zoomOutButton
        width: 60
        height: 60
        anchors {
            right: parent.right
            top: parent.verticalCenter
        }
        onClicked: {
            view.map.zoomLevel -= 1; // Уменьшение уровня масштабирования на 1
        }
        icon.source: "qrc:/ui/minus.png"
    }

    RoundButton {
        //text: "+"
        id: zoomInButton
        width: 60
        height: 60
        anchors {
            right: parent.right
            bottom: parent.verticalCenter
        }
        onClicked: {
            view.map.zoomLevel += 1; // Увеличение уровня масштабирования на 1
        }
        icon.source: "qrc:/ui/plus.png"
    }

    Row {
        id: zoomLevelLayout
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }

        Image {
            source: "qrc:/ui/leans.png"
            width: 30
            height: 30
        }

        Text {
            id: zoomLevelText
            text: " " + Math.floor(view.map.zoomLevel)
            color: "black"
            font.bold: true
            font.pixelSize: 20
            //leftMargin: 5
        }
    }
}
