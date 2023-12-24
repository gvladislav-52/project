// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

Item {
    id: appWindow
    signal selectTool(string tool);
     property variant mapview
     property variant plugin
     property variant parameters
    property variant coordinateYou
    property variant fromCoordinate: QtPositioning.coordinate(56.307706, 43.984085)
    property variant toCoordinate: QtPositioning.coordinate(55.320688, 42.167970)

    function initializeProviders(provider1)
    {
        var provider = "osm"
        if (parameters && parameters.length>0)
            plugin = Qt.createQmlObject ('import QtLocation; Plugin{ name:"' + provider + '"; parameters: appWindow.parameters}', appWindow)
        else
            plugin = Qt.createQmlObject ('import QtLocation; Plugin{ name:"' + provider + '"}', appWindow)

        mapview = mapComponent.createObject(page);
        mapview.map.plugin = plugin;
    }

    PositionSource {
        id: positionSource
        property variant lastSearchPosition: QtPositioning.coordinate(56.326802, 44.006506) //Initialized/Fallback to Oslo
        active: true
        updateInterval: 120000 // 2 mins
        onPositionChanged:  {
            var distance = lastSearchPosition.distanceTo(position.coordinate)
            if (distance > 500) {
                lastSearchPosition = positionSource.position.coordinate
            }
        }
    }

    PlaceSearchModel
    {
        id: searchModel
        searchTerm: "food"
        searchArea: QtPositioning.circle(positionSource.lastSearchPosition, 1000)
        Component.onCompleted: update()
    }

    height: parent.height
    width: parent.width
    visible: true

    onSelectTool: (tool) => {
        switch (tool) {
        case "CoordinateRoute":
            stackView.pop({item:page, immediate: true})
            // stackView.push("qrc:/RouteCoordinateForm.ui.qml" ,
            //                     { "toCoordinate": toCoordinate,
            //                        "fromCoordinate": fromCoordinate})
            mapview.calculateCoordinateRoute(toCoordinate,fromCoordinate)
            //stackView.currentItem.closeForm.connect(stackView.closeForm)
            break
        default:
        console.log("Unsupported operation")
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        focus: true
        initialItem: Item {
            id: page

            Text {
                visible: !supportsSsl && map && mapview.activeMapType && activeMapType.metadata.isHTTPS
                text: "The active map type\n
requires (missing) SSL\n
support"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: appWindow.width / 12
                font.bold: true
                color: "grey"
                anchors.centerIn: parent
                z: 12
            }
        }

        // function showMessage(title,message,backPage)
        // {
        //     push("forms/Message.qml",
        //                        {
        //                            "title" : title,
        //                            "message" : message,
        //                            "backPage" : backPage
        //                        })
        //     currentItem.closeForm.connect(closeMessage)
        // }

        // function closeMessage(backPage)
        // {
        //     pop(backPage)
        // }

        // function closeForm()
        // {
        //     pop(page)
        // }

    //     function showRouteListPage()
    //     {
    //         push("forms/RouteList.qml",
    //                            {
    //                                "routeModel" : mapview.routeModel
    //                            })
    //         currentItem.closeForm.connect(closeForm)
    //     }
     }


    Component {
        id: mapComponent

        MapComponent {
            id: mapview_comp
            width: page.width
            height: page.height
            map.center: fromCoordinate
            map.zoomLevel: (maximumZoomLevel - minimumZoomLevel)/2
             map.onSupportedMapTypesChanged: mainMenu.mapTypeMenu.createMenu(map)

            // TapHandler {
            //     onTapped: {
            //     }
            // }

            Image {
                id: mapSunSet
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.left
                    rightMargin: -parent.width * 0.055
                }

                width: parent.width/20
                height: parent.height/20
                fillMode: Image.PreserveAspectFit
                source:
                {
                    right_temp_qml.carLocked ? "qrc:/ui/15810.png": "qrc:/ui/sun.png"
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        right_temp_qml.setcarLockeder(!right_temp_qml.carLocked)
                        if(right_temp_qml.carLocked)
                            mainMenu.mapTypeMenu.createMenu(map,0)
                        else
                            mainMenu.mapTypeMenu.createMenu(map,3)
                    }
                }
            }

            Button
            {
                text: qsTr("Route with coordinates")
                enabled: plugin ? plugin.supportsRouting() : false
                onClicked: selectTool("CoordinateRoute")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }



    MainMenu {id: mainMenu}
}
