// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

Item {
    id: appWindow
    property string tempText: textSearch.text
    signal selectTool(string tool);
     property variant mapview
     property variant plugin
     property variant parameters
    property variant coordinateYou
    property variant fromCoordinate: QtPositioning.coordinate(56.307706, 43.984085)
    property variant toCoordinate: QtPositioning.coordinate(55.320688, 42.167970)
    signal showRoute(variant startCoordinate,variant endCoordinate)
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

    Address {
        id :fromAddress
        street: "Sandakerveien 116"
        city: "Oslo"
        country: "Norway"
        state : ""
        postalCode: "0484"
    }
    //! [geocode0]

    Address {
        id: toAddress
        street: "Holmenkollveien 140"
        city: "Oslo"
        country: "Norway"
        postalCode: "0791"
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
        case "AddressRoute":
            stackView.pop({item:page, immediate: true})
                          tempGeocodeModel.reset()
                          fromAddress.country =  "Россия"
                          fromAddress.street = "проспект Гагарина, 1"
                          fromAddress.city =  "Нижний Новгород"
                          toAddress.country = "Россия"
                          toAddress.street = "Бекетова, 25"
                          toAddress.city = "Москва"
                          tempGeocodeModel.startCoordinate = QtPositioning.coordinate()
                          tempGeocodeModel.endCoordinate = QtPositioning.coordinate()
                          tempGeocodeModel.query = fromAddress
                          tempGeocodeModel.update();
                          //goButton.enabled = false;
            showRoute.connect(mapview.calculateCoordinateRoute)
            //stackView.currentItem.showMessage.connect(stackView.showMessage)
            //stackView.currentItem.closeForm.connect(stackView.closeForm)
            break
        case "CoordinateRoute":
            stackView.pop({item:page, immediate: true})
            // stackView.push("qrc:/RouteCoordinateForm.ui.qml" ,
            //                     { "toCoordinate": toCoordinate,
            //                        "fromCoordinate": fromCoordinate})
            mapview.calculateCoordinateRoute(fromCoordinate,toCoordinate)
            //stackView.currentItem.closeForm.connect(stackView.closeForm)
            break
        default:
        console.log("Unsupported operation")
        }
    }

    GeocodeModel {
        id: tempGeocodeModel
        plugin: mapview.map.plugin
        property int success: 0
        property variant startCoordinate
        property variant endCoordinate

        onCountChanged: {
            if (success == 1 && count == 1) {
                query = toAddress
                update();
            }
        }

        onStatusChanged: {
            if ((status == GeocodeModel.Ready) && (count == 1)) {
                success++
                if (success == 1) {
                    startCoordinate.latitude = get(0).coordinate.latitude
                    startCoordinate.longitude = get(0).coordinate.longitude
                }
                if (success == 2) {
                    endCoordinate.latitude = get(0).coordinate.latitude
                    endCoordinate.longitude = get(0).coordinate.longitude
                    success = 0
                    if (startCoordinate.isValid && endCoordinate.isValid)
                        showRoute(startCoordinate,endCoordinate)
                }
            }
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
                enabled: plugin ? plugin.supportsRouting() : false
                //onClicked: selectTool("CoordinateRoute")
                anchors.left: searchRectangle.right
                anchors.leftMargin: searchRectangle.width/20
                anchors.verticalCenter: searchRectangle.verticalCenter
                width: searchRectangle.width/2
                height: searchRectangle.height

                background: Rectangle {
                        color: "green"
                        radius: 4
                        Text {
                            id: textButton
                            text: qsTr("Enter")
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: parent.height/2
                            color: "white"
                        }
                        border.color: "black"
                        border.width: 1
                    }
                onClicked: selectTool("AddressRoute")
            }

            Rectangle {
                id: searchRectangle
                color: "white"
                width: appWindow.width/4
                height: appWindow.height/15
                anchors.top: parent.top
                anchors.topMargin: parent.height/20
                anchors.left: parent.left
                anchors.leftMargin: parent.width/15
                radius: 4
                border.color: "black"
                border.width: 1

                TextInput {
                    id: textSearch
                    text: "Oslo"
                    anchors.fill: parent
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignLeft
                    font.pixelSize: parent.height/3
                    selectByMouse: true
                    //selectByKeyboard: true
                }
            }
        }
    }



    MainMenu {id: mainMenu}
}
