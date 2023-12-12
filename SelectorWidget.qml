import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: selectButtonFooter
    anchors.bottom: parent.bottom
    color: "black"

    ToolButton {
        id: ventButton
        icon.source: "qrc:/ui/Vint.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.horizontalCenter: selectButtonFooter.horizontalCenter
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
        hoverEnabled: false

        background: Rectangle {
            color: ventButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ColumnLayout {
        id: columnTempLeft
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: ventButton.left
        anchors.leftMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonLeft
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: textTempLeft.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonLeft.pressed ? "lightgray" : "transparent"
                radius: 10
            }
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
            implicitWidth: textTempLeft.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonLeft.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }
    }

    ColumnLayout {
        id: columnTempRight
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: ventButton.right
        anchors.rightMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonRight
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: textTempRight.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonRight.pressed ? "lightgray" : "transparent"
                radius: 10
            }
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
            implicitWidth: textTempRight.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonRight.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }
    }

    ToolButton {
        id: seatButtonLeft
        icon.source: "qrc:/ui/seatLeft.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: columnTempLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: seatButtonLeft.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: seatButtonRight
        icon.source: "qrc:/ui/seatRight.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: columnTempRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: seatButtonRight.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: heaperButtonBack
        icon.source: "qrc:/ui/heaperback.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: seatButtonLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: heaperButtonBack.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: heaperButtonFront
        icon.source: "qrc:/ui/heaperfront.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonBack.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: heaperButtonFront.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: carButton
        icon.source: "qrc:/ui/carIcon.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonFront.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: carButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: musicButton
        icon.source: "qrc:/ui/music.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: seatButtonRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: musicButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: phoneButton
        icon.source: "qrc:/ui/phone.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: musicButton.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: phoneButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }

    }

    ColumnLayout {
        id: columnSound
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: phoneButton.right
        anchors.rightMargin: -parent.width * 0.08

        ToolButton {
            id: upButtonSound
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonSound.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: soundButton
            icon.source: "qrc:/ui/sound.png"
            anchors.verticalCenter: selectButtonFooter.verticalCenter
            icon.width: selectButtonFooter.width * 0.25
            icon.height: selectButtonFooter.height * 0.25
            hoverEnabled: false

            background: Rectangle {
                color: soundButton.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: downButtonSound
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonSound.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }
    }
}
