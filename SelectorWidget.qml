import QtQuick 2.0

Rectangle {
    width: parent.height/8  // Ширина равна ширине родительского элемента минус 20 пикселей
    height: parent.height/2.5 // Устанавливаем высоту квадрата
    color: "black" // Устанавливаем цвет квадрата
    anchors.top: parent.top // Размещаем квадрат вверху родительского элемента
    anchors.left: parent.left // Размещаем квадрат слева родительского элемента
    //anchors.topMargin: 5 // Добавляем отступ сверху в 5 пикселей
    //anchors.leftMargin: 5 // Добавляем отступ слева в 5 пикселей
}
