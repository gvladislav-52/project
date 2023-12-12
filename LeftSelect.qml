import QtQuick 2.0
import QtQuick.Controls
Rectangle {
    color: "white"
    width: 200
    height: 200


        ToolButton {
            id: chargeButton
            icon.source: "qrc:/ui/charge.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            icon.width: parent.width * 0.35 // Масштабирование ширины иконки
            icon.height: parent.height * 0.35 // Масштабирование высоты иконки
            hoverEnabled: false

            background: Rectangle {
                color: chargeButton.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: speedButton
            icon.source: "qrc:/ui/speed.png"
            anchors.left: chargeButton.horizontalCenter
            anchors.leftMargin: -parent.width * 0.3
            anchors.verticalCenter: parent.verticalCenter
            icon.width: parent.width * 0.35 // Масштабирование ширины иконки
            icon.height: parent.height * 0.35 // Масштабирование высоты иконки
            hoverEnabled: false

            background: Rectangle {
                color: speedButton.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: microButton
            icon.source: "qrc:/ui/setting.png"
            anchors.right: chargeButton.horizontalCenter
            anchors.rightMargin: -parent.width * 0.3
            anchors.verticalCenter: parent.verticalCenter
            icon.width: parent.width * 0.35 // Масштабирование ширины иконки
            icon.height: parent.height * 0.35 // Масштабирование высоты иконки
            hoverEnabled: false

            background: Rectangle {
                color: microButton.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

}
