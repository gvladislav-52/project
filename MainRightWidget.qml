import QtQuick 2.0

Item {
    MapWidget {}
    MusicWidget {
           anchors.bottom: parent.bottom // Размещаем MusicWidget внизу экрана
           anchors.leftMargin: 5 // отступ слева
           anchors.rightMargin: 10
           anchors.horizontalCenter: horizontalCenter
       }
    SelectorWidget {}
}
