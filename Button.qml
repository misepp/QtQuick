import QtQuick 2.5

Rectangle {
    id: button
    height: 40
    radius: 10
    border.color: borderColor
    smooth: true
    color: mouse1.pressed ? pressedColor : releasedColor
    transformOrigin: Item.Center

    property alias buttonText: text1.text
    property color pressedColor: "green"
    property color releasedColor: "lightgreen"
    property color borderColor: "black"

    property alias mouseB: mouse1

    signal buttonClicked()


    Text {
        id: text1
        anchors.centerIn: parent
        text: ""
        font.pointSize: 14
    }

    MouseArea {
        id: mouse1
        anchors.fill: parent
        onClicked: { buttonClicked(); }
    }
}
