import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

Item {
    id: appWindow
    property string tempText: textSearch.text
    signal selectTool();
     property variant mapview
     property variant plugin
     property variant parameters
    property variant coordinateYou
    property variant fromCoordinate: QtPositioning.coordinate(56.307706, 43.984085)
    property variant toCoordinate: QtPositioning.coordinate(55.320688, 42.167970)
    signal showRoute(variant startCoordinate,variant endCoordinate)
    property string toCoordinateText

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

    height: parent.height
    width: parent.width
    visible: true

     Address {
         id: toAddress
         //street: "Зеленая 2"
         //"Ковров Маяковского 6"
         //Выкса Ближне-Песочное Зеленая 2
         //Пыщуг Луговая 3
         city: toCoordinateText
    }

    onSelectTool: {
        tempGeocodeModel.reset()
        tempGeocodeModel.endCoordinate = QtPositioning.coordinate()
        tempGeocodeModel.query = toAddress
        tempGeocodeModel.update();
        showRoute.connect(mapview.calculateCoordinateRoute)
    }

    GeocodeModel {
        id: tempGeocodeModel
        plugin: mapview.map.plugin
        property variant endCoordinate

        onStatusChanged: {
            endCoordinate.latitude = get(0).coordinate.latitude
            endCoordinate.longitude = get(0).coordinate.longitude
            showRoute(fromCoordinate,endCoordinate)
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

            Rectangle {
                id: searchRectangle
                color: "white"
                width: appWindow.width / 4
                height: appWindow.height / 15
                anchors.top: parent.top
                anchors.topMargin: parent.height / 20
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 15
                radius: 4
                border.color: "black"
                border.width: 1
                clip: true

                TextInput {
                    id: textSearch
                    text: "Search..."
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                    width: parent.width - 10
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignLeft
                    font.pixelSize: parent.height / 3
                    selectByMouse: true

                    Keys.onReturnPressed: {
                        toCoordinateText = textSearch.text
                        selectTool()
                    }

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            textSearch.text = ""
                        }
                    }
                }
            }

            Button {
                enabled: plugin ? plugin.supportsRouting() : false
                anchors.left: searchRectangle.right
                anchors.leftMargin: searchRectangle.width / 20
                anchors.verticalCenter: searchRectangle.verticalCenter
                width: searchRectangle.width / 2
                height: searchRectangle.height
                background: Rectangle {
                    color: "green"
                    radius: 4
                    Text {
                        id: textButton
                        text: qsTr("Enter")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: parent.height / 2
                        color: "white"
                    }
                    border.color: "black"
                    border.width: 1
                }
                onClicked: {
                    toCoordinateText = textSearch.text
                    selectTool()
                }
            }
        }
    }



    MainMenu {id: mainMenu}
}
