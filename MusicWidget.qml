import QtQuick 2.0

Item {
    visible: true
    anchors.fill: parent
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        anchors.bottomMargin: 5
        height: 125
        color: "white"
        opacity: 0.95

        Text {
            id: redittext
            text:  rightClass.currentTime // model.textValue - это свойство, которое вы установите из C++ кода
            color: "black"
            font.bold: true
            font.pixelSize: parent.width * 0.04
            //anchors.right: battery.left // Изменён анкер - теперь текст размещается слева от изображения
            anchors.verticalCenter: battery.verticalCenter // Чтобы текст и изображение были выровнены по вертикали
            anchors.rightMargin: 5
        }
    }
}
