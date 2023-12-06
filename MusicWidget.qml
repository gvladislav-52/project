import QtQuick 2.0

Rectangle {
    width: parent.width - 20
    height: 125 // Устанавливаем высоту квадрата
    color: "white" // Устанавливаем цвет квадрата
    anchors.horizontalCenter: parent.horizontalCenter // Размещаем квадрат по горизонтальному центру родительского элемента
    anchors.bottom: parent.bottom // Размещаем квадрат внизу родительского элемента
    anchors.bottomMargin: 5 // Добавляем отступ снизу в 5 пикселей
}
