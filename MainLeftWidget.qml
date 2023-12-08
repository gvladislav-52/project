import QtQuick 2.0
import QtQuick.Layouts 1.15

Item {

    ColumnLayout {
        anchors.fill: parent

        LeftCharge {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        LeftImage {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        LeftSelect {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
