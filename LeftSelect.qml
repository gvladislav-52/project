import QtQuick 2.0
import QtQuick.Controls
Rectangle {
    color: "white" // Устанавливаем цвет квадрата
    width: 200
    height: 200


        ToolButton {
            width: parent.width * 0.15
            height: parent.height * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            contentItem: Image {
                source: "qrc:/ui/charge.png"
                fillMode: Image.PreserveAspectFit
            }

        }

        ToolButton {
            width: parent.width * 0.15
            height: parent.height * 0.5
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: -parent.width * 0.35
            contentItem: Image {
                source: "qrc:/ui/speed.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        ToolButton {
            width: parent.width * 0.15
            height: parent.height * 0.5
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: -parent.width * 0.35
            contentItem: Image {
                source: "qrc:/ui/setting.png"
                fillMode: Image.PreserveAspectFit
            }
        }
}
