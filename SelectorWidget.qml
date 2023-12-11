import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: selectButtonFooter
    anchors.bottom: parent.bottom
    color: "black"

    ToolButton {
        id: ventButton
        icon.source: "qrc:/ui/Vint.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.horizontalCenter: selectButtonFooter.horizontalCenter
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ColumnLayout {
        id: columnTempLeft
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.left: ventButton.left
        anchors.leftMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonLeft
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: textTempLeft.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter // Выравнивание кнопки по верхнему краю и по центру по горизонтали
        }

        Text {
            id: textTempLeft
            text: qsTr("70°");
            color: "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonLeft
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: textTempLeft.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter // Выравнивание кнопки по нижнему краю и по центру по горизонтали
        }
    }

    ColumnLayout {
        id: columnTempRight
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.right: ventButton.right
        anchors.rightMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonRight
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: textTempRight.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter // Выравнивание кнопки по верхнему краю и по центру по горизонтали
        }

        Text {
            id: textTempRight
            text: qsTr("68°");
            color: "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonRight
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: textTempRight.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter // Выравнивание кнопки по нижнему краю и по центру по горизонтали
        }
    }

    ToolButton {
        id: seatButtonLeft
        icon.source: "qrc:/ui/seatLeft.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.left: columnTempLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: seatButtonRight
        icon.source: "qrc:/ui/seatRight.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.right: columnTempRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: heaperButtonBack
        icon.source: "qrc:/ui/heaperback.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.left: seatButtonLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: heaperButtonFront
        icon.source: "qrc:/ui/heaperfront.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.left: heaperButtonBack.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: carButton
        icon.source: "qrc:/ui/carIcon.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.left: heaperButtonFront.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: musicButton
        icon.source: "qrc:/ui/music.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.right: seatButtonRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ToolButton {
        id: phoneButton
        icon.source: "qrc:/ui/phone.png" // путь к вашей картинке
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.right: musicButton.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
    }

    ColumnLayout {
        id: columnSound
        anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
        anchors.right: phoneButton.right
        anchors.rightMargin: -parent.width * 0.08

        ToolButton {
            id: upButtonSound
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: soundButton.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter // Выравнивание кнопки по верхнему краю и по центру по горизонтали
        }

        ToolButton {
            id: soundButton
            icon.source: "qrc:/ui/sound.png" // путь к вашей картинке
            anchors.verticalCenter: selectButtonFooter.verticalCenter // Выравнивание по вертикали по центру
            icon.width: selectButtonFooter.width * 0.3 // Масштабирование ширины иконки
            icon.height: selectButtonFooter.height * 0.3 // Масштабирование высоты иконки
        }

        ToolButton {
            id: downButtonSound
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: soundButton.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: selectButtonFooter.height * 0.2 // Масштабирование высоты кнопки
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter // Выравнивание кнопки по нижнему краю и по центру по горизонтали
        }
    }
}
