// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtLocation
import QtPositioning
import QtQuick.Controls
import QtQuick.Layouts

Item {

//     property alias plugin : tempGeocodeModel.plugin;
//     property variant fromAddress;
//     property variant toAddress;
//     signal showRoute(variant startCoordinate,variant endCoordinate)


//     Button {
//         id: goButton
//         text: qsTr("Proceed")
//         anchors.horizontalCenter: parent.horizontalCenter
//         anchors.verticalCenter: parent.verticalCenter
//         onClicked: {
//                 tempGeocodeModel.reset()
//                 fromAddress.country =  "Россия"
//                 fromAddress.street = "проспект Гагарина 1"
//                 fromAddress.city =  "Нижний Новгород"
//                 toAddress.country = "Norway"
//                 toAddress.street = "Sandakerveien 116"
//                 toAddress.city = "Oslo"
//                 tempGeocodeModel.startCoordinate = QtPositioning.coordinate()
//                 tempGeocodeModel.endCoordinate = QtPositioning.coordinate()
//                 tempGeocodeModel.query = fromAddress
//                 tempGeocodeModel.update();
//                 goButton.enabled = false;
//             }


// }

//     Button {
//         id: del
//         text: qsTr("Proceed")
//         anchors.left: goButton.right
//         anchors.verticalCenter: parent.verticalCenter
//         onClicked: {
//                 stackView.pop()
//             }


}



    GeocodeModel {
        id: tempGeocodeModel

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
}
