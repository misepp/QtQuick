import QtQuick 2.5

Rectangle {
    id: closingButton
    height: 30
    width: 30
    radius: 20
    border.color: borderColor
    smooth: true
    color: mouse1.pressed ? pressedColor : releasedColor
    transformOrigin: Item.Center

    property alias buttonText: text1.text
    property color pressedColor: "red"
    property color releasedColor: "lightgreen"
    property color borderColor: "black"

    signal buttonClicked()

    Text {
        id: text1
        anchors.centerIn: parent
        text: "Exit"
        font.pointSize: 8
    }

    MouseArea {
        id: mouse1
        anchors.fill: parent
        onClicked: { buttonClicked(); }
    }
}
