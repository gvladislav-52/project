import QtQuick 2.0
import QtQuick.Layouts 1.15

Item {

    ColumnLayout {
        anchors.fill: parent

        LeftCharge {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/4
        }

        LeftImage {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/2
        }

        LeftSelect {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/4
        }
    }
}
