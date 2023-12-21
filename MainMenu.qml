// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtLocation

Item {
    id: menuBar
    property variant mapTypeMenu: mapTypeMenu
    //property variant toolsMenu: toolsMenu
    property variant plugin
    // property alias isFollowMe: toolsMenu.isFollowMe
    // property alias isMiniMap: toolsMenu.isMiniMap

    signal selectMapType(variant mapType)
    // signal selectTool(string tool);
    // signal toggleMapState(string state)

    function clearMenu(menu)
    {
        while (menu.count)
            menu.removeItem(menu.itemAt(0))
    }

    Item {
        id: mapTypeMenu
        //title: qsTr("MapType")

        Component {
            id: mapTypeMenuActionComponent
            Action {

            }
        }
        function createMenu(map, num = 0)
        {
            clearMenu(mapTypeMenu)
            createMapTypeMenuItem(map.supportedMapTypes[num], map.activeMapType === map.supportedMapTypes[num]);
            console.log("Запрос1")
        }

        function createMapTypeMenuItem(mapType, checked)
        {
            addAction(mapview.map.activeMapType = mapType)
            console.log("Запрос2")
        }
    }

    // Menu {
    //     id: toolsMenu
    //     property bool isFollowMe: false;
    //     property bool isMiniMap: false;
    //     property variant plugin: menuBar.plugin

    //     title: qsTr("Tools")

    //     Action {
    //         text: qsTr("Reverse geocode")
    //         enabled: plugin ? plugin.supportsGeocoding(Plugin.ReverseGeocodingFeature) : false
    //         onTriggered: selectTool("RevGeocode")
    //     }
    //     MenuItem {
    //         text: qsTr("Geocode")
    //         enabled: plugin ? plugin.supportsGeocoding() : false
    //         onTriggered: selectTool("Geocode")
    //     }
    //     MenuItem {
    //         text: qsTr("Route with coordinates")
    //         enabled: plugin ? plugin.supportsRouting() : false
    //         onTriggered: selectTool("CoordinateRoute")
    //     }
    //     MenuItem {
    //         text: qsTr("Route with address")
    //         enabled: plugin ? plugin.supportsRouting() : false
    //         onTriggered: selectTool("AddressRoute")
    //     }
    //     MenuItem {
    //         text: isMiniMap ? qsTr("Hide minimap") : qsTr("Minimap")
    //         onTriggered: toggleMapState("MiniMap")
    //     }
    //     MenuItem {
    //         text: isFollowMe ? qsTr("Stop following") : qsTr("Follow me")
    //         onTriggered: toggleMapState("FollowMe")
    //     }
    //     MenuItem {
    //         text: qsTr("Language")
    //         onTriggered: selectTool("Language")
    //     }
    //     MenuItem {
    //         text: qsTr("Prefetch Map Data")
    //         onTriggered: selectTool("Prefetch")
    //     }
    //     MenuItem {
    //         text: qsTr("Clear Map Data")
    //         onTriggered: selectTool("Clear")
    //     }
    // }
}
