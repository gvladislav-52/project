import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 1024
    height: 680
    visible: true
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent

        // Loader {
        //     source: "qrc:/123.qml"
        // }
        MainLeftWidget {
            Layout.fillHeight: true
            //Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.3
        }

        MainRightWidget {
            Layout.fillHeight: true
            //Layout.fillWidth: true
            Layout.preferredWidth: parent.width * 0.7
        }
    }

    // Loader {
    //     source: "qrc:/MainLeftWidget.qml"
    //     Layout.fillHeight: true
    //     //Layout.fillWidth: true
    //     Layout.preferredWidth: parent.width * 0.3
    // }
}
