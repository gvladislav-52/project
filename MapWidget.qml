import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls

Item {
    visible: true
    anchors.fill: parent

    Plugin {
        id: myPlugin
        name: "osm"
    }

    PositionSource {
        id: positionSource
        property variant lastSearchPosition: QtPositioning.coordinate(56.307706, 43.984085)
        active: true
        updateInterval: 120000
        onPositionChanged:  {
            var distance = lastSearchPosition.distanceTo(position.coordinate)
            if (distance > 500) {
                lastSearchPosition = positionSource.position.coordinate
            }
        }
    }

    PlaceSearchModel {
        id: searchModel

        plugin: myPlugin

        searchTerm: "school"
        searchArea:  QtPositioning.circle(positionSource.lastSearchPosition, 1000)
        Component.onCompleted: update()
    }

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

    Connections {
        target: searchModel
        function onStatusChanged() {
            if (searchModel.status == PlaceSearchModel.Error)
                console.log(searchModel.errorString());
        }
    }

    RoundButton {
        id: zoomOutButton
        width: 60
        height: 60
        anchors {
            right: parent.right
            top: parent.verticalCenter
            rightMargin: 10
            topMargin: 2
        }
        onClicked: {
            view.map.zoomLevel -= 1;
        }
        icon.source: "qrc:/ui/minus.png"
    }

    RoundButton {
        id: zoomInButton
        width: 60
        height: 60
        anchors {
            right: parent.right
            bottom: parent.verticalCenter
            rightMargin: 10
            bottomMargin: 2
        }
        onClicked: {
            view.map.zoomLevel += 1;
        }
        icon.source: "qrc:/ui/plus.png"
    }
}
