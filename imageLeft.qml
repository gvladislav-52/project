import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    width: 400
    height: 400

    Image {
        source: "qrc:/ui/carUp1.png" // путь к вашей картинке
        anchors.fill: parent // растягиваем картинку на всю доступную площадь
    }

    Repeater {
        model: [
            {text: "Top", bWidth: parent.width * 0.5, bHeight: parent.width * 0.2, hAnchorCenter: parent.horizontalCenter, bTop: parent.top, bTopMargin: 50, bOpacity: 0.5}
        ]

     Button
        {
            text: modelData.text
            width: modelData.bWidth // ширина кнопки будет равна 20% ширины родительского элемента
            height: modelData.bHeight // высота кнопки будет равна 20% высоты родительского элемента
            anchors.horizontalCenter: modelData.hAnchorCenter
            anchors.top: modelData.bTop
            anchors.topMargin: modelData.bTopMargin
            opacity: modelData.bOpacity
        }
    }

    Button {
        text: "LeftUp"
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.rightMargin: 50 // отступ справа
        anchors.bottomMargin: -30
        opacity: 0.5

    }

    Button {
        text: "RightUp"
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.left: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.leftMargin: 50 // отступ слева
        anchors.bottomMargin: -30
        opacity: 0.5
    }

    Button {
        text: "LeftDown"
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.right: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.rightMargin: 50 // отступ справа
        anchors.topMargin: 30
        opacity: 0.5
    }

    Button {
        text: "RightDown"
        width: parent.width * 0.2 // ширина кнопки будет равна 20% ширины родительского элемента
        height: parent.height * 0.2 // высота кнопки будет равна 20% высоты родительского элемента
        anchors.left: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.leftMargin: 50 // отступ слева
        anchors.topMargin: 30
        opacity: 0.5 // кнопка полностью прозрачна
    }

    Button {
        text: "Bottom"
        width: parent.width * 0.4 // ширина кнопки будет равна 20% ширины родительского элемента
        height: parent.height * 0.1 // высота кнопки будет равна 20% высоты родительского элемента
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 45
        opacity: 0.5 // кнопка полупрозрачна
    }
}


