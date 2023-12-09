import QtQuick 2.0

Rectangle {
    color: "white" // Устанавливаем цвет квадрата
    width: 200
    height: 200

    Image {
        source: "qrc:/ui/thunder.png" // путь к вашей картинке
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 15 // Отступ картинки от верхней части
        width: parent.width * 0.15
        height: parent.height * 0.5
        anchors.top: parent.top
    }

    Rectangle {
        color: "black"
        width: parent.width
        height: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Image {
        id: battery
        source: "qrc:/ui/battery.png" // путь к вашей картинке
        anchors.right: parent.right // Размещаем изображение справа
        width: parent.width * 0.15
        height: parent.height * 0.25
        anchors.bottomMargin: 10
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
    }

    Text {
        id: redittext
        text:  qsTr("100%");
        color: "black"
        font.bold: true
        font.pixelSize: parent.width * 0.04
        anchors.right: battery.left // Изменён анкер - теперь текст размещается слева от изображения
        anchors.verticalCenter: battery.verticalCenter // Чтобы текст и изображение были выровнены по вертикали
        anchors.rightMargin: 5
    }

    Text {
        text: qsTr("Charging Complete:")
        color: "black"
        font.bold: true
        font.pixelSize: parent.width * 0.04
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.bottomMargin: 12
    }
}



