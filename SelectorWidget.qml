import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: asd
    anchors.bottom: parent.bottom
    color: "black"
    ColumnLayout {
        id: rowTemp
        anchors.centerIn: asd
        Layout.preferredWidth: asd.width
        Layout.preferredHeight: asd.height

        ToolButton {
            id: zoomInButton
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: text.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: asd.height * 0.2 // Масштабирование высоты кнопки
            //Layout.alignment: Qt.AlignTop | Qt.AlignHCenter // Выравнивание кнопки по верхнему краю и по центру по горизонтали
        }

        Text {
            id: text
            text: qsTr("70°");
            color: "white"
            font.bold: true
            font.pixelSize: Math.min(asd.width, asd.height) * 0.25
        }

        ToolButton {
            id: zoomInButton2
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: text.width // Привязка ширины кнопки к ширине текста
            Layout.preferredHeight: asd.height * 0.2 // Масштабирование высоты кнопки
            //Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter // Выравнивание кнопки по нижнему краю и по центру по горизонтали
        }
    }
}
