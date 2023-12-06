import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width: 400
    height: 400

    Image {
        source: "qrc:/ui/carUp1.png" // путь к вашей картинке
        anchors.fill: parent // растягиваем картинку на всю доступную площадь
    }

    Button
    {
        text: "Bottom"
        width: parent.width * 0.35
        height: parent.height * 0.15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        opacity: 0.5
    }

    Button
    {
        text: "Top"
        width: parent.width * 0.45
        height: parent.height * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        opacity: 0.5
    }

    Button {
        text: "LeftUp"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.rightMargin: 40 // отступ слева
        anchors.bottomMargin: -20
        opacity: 0.5
    }

    Button {
        text: "RightUp"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.left: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.leftMargin: 40 // отступ слева
        anchors.bottomMargin: -20
        opacity: 0.5
    }

    Button {
        text: "LeftDown"
        width: parent.width * 0.175
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.rightMargin: 40 // отступ справа
        anchors.topMargin: 20
        opacity: 0.5
    }

    Button {
        text: "RightDown"
        width: parent.width * 0.175 // ширина кнопки будет равна 20% ширины родительского элемента
        height: parent.height * 0.2 // высота кнопки будет равна 20% высоты родительского элемента
        anchors.left: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.leftMargin: 40 // отступ слева
        anchors.topMargin: 20
        opacity: 0.5 // кнопка полностью прозрачна
    }
}


