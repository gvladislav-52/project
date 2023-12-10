import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 1024
    height: 680
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
    RowLayout {
        anchors.fill: parent
        MainLeftWidget {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.3
        }

        MainRightWidget {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.7
        }
    }
    SelectorWidget {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.13
        }
    }
}
