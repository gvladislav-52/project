import QtQuick 2.0
import QtLocation 5.6

Item {
    width: 800
    height: 600

    Plugin {
        id: mapPlugin
        name: "osm" // Используем OpenStreetMap
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin

        center {
            latitude: 56.307706 // Широта точки на карте
            longitude: 43.984085 // Долгота точки на карте
        }

        zoomLevel: 18// Уровень масштабирования карты (1-20)
    }
}
