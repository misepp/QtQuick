import QtQuick 2.5

Rectangle {
    id: mainRect
    //property alias mainRect: mainRect
    width: 500
    height: 360
    //property alias mouseArea: mouseArea

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
