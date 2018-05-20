import QtQuick 2.5

Rectangle {
    id: mainRect
    width: 400
    height: 400
    color: "yellow"
    opacity: 0

    signal viewButton1Clicked()
    signal viewButton2Clicked()

    property int xCoordinate: 0

    Component.onCompleted: {
        mainRect.xCoordinate = mainRect.x
        console.log("Component completed and X is: " + mainRect.x + " xCoord property is: " + mainRect.xCoordinate)
    }

    Text {
        id: headerText
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "The game"
        font.bold: true
        font.pointSize: 18
    }
    Column {
        id: buttons
        anchors.top: headerText.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 15
/*
        populate: Transition {
            NumberAnimation { properties: "x,y"; from: 0;
                duration: 1500; easing.type: Easing.OutBounce }
        }
        move: Transition {
            NumberAnimation { properties: "y"; easing.type: Easing.OutQuad }
        }
*/

        Button {
            id: button1
            width: mainRect.width-60
            buttonText: "Back to MENU"

            onButtonClicked: {
                //viewButton1Clicked()
                console.log("MyView HDE!")
                mainRect.state = ""
            }
        }

        Button {
            id: button2
            width: mainRect.width-60
            buttonText: "Start"

            onButtonClicked: {
                console.log("NAPS")
                if(Component.status != Component.Error) {
                    console.log("TILANNE OK");
                var component = Qt.createComponent("GameRect.qml");
                var object = component.createObject(mainRect,
                          {
                           "anchors.top": buttons.bottom,
                           "anchors.topMargin": 30,
                           "z": 3
                          });
                object.state = "showGameRect";
                }

            }
        }
    }


    states: [
        State {
        name: "showView"
        PropertyChanges { target: mainRect; opacity: 1}
    },
        State {
            name: ""
            PropertyChanges {target: mainRect; opacity: 0}
        }
    ]

    transitions: [ Transition {
        from: ""
        to: "showView"
        NumberAnimation { property: "opacity"; duration: 1000}
    },
        Transition {
            from: "showView"
            to: ""
            SequentialAnimation {
                NumberAnimation { property: "opacity"; duration: 1000 }
                ScriptAction {script: mainRect.deleteObject()}
            }
        }
    ]


    function deleteObject() {
        //mainRect.x = mainRect.xCoordinate
        console.log("mainRect X: " + mainRect.x + " the var is: " + mainRect.xCoordinate)
        mainRect.destroy()
    }



    CloseButton {
        id: closeView
        anchors.right: parent.right
        anchors.bottom:  parent.bottom
        onButtonClicked: { Qt.quit() }
    }

}
