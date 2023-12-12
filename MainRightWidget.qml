import QtQuick 2.0

Item {
    MapWidget {}
    HeaderMapWidget {}
    SelectorMapWidget {}
    MusicWidget {
           anchors.bottom: parent.bottom
           anchors.leftMargin: 5
           anchors.rightMargin: 10
           anchors.horizontalCenter: horizontalCenter
       }
}
