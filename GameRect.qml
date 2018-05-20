import QtQuick 2.5

Rectangle {
    id: theGame
    //height: 200
    //width: 300
    opacity: 0
    //z: 10
    //x: parent.width
    width: parent.width
    height: parent.height/3
    //radius: 20
    border.color: borderColor
    smooth: true
    color: mouse1.pressed ? pressedColor : releasedColor

    property color pressedColor: "red"
    property color releasedColor: "lightgreen"
    property color borderColor: "black"

    property int parentHeight: parent.height

    property alias theTimer: gameTimer

    signal buttonClicked()

    /*onButtonClicked: {
        theGame.state = ""
        gameTimer.running = false
    }*/

    states: [ State {
        name: "showGameRect"
        PropertyChanges { target: theGame; opacity: 1}
    },
        State {
            name: ""
            PropertyChanges { target: theGame; opacity: 0}
        }
    ]
    transitions: [ Transition {
        from: ""
        to: "showGameRect"
        //reversible: true
        NumberAnimation { property: "opacity"; duration: 1000;}
       },
        Transition {
            from: "showGameRect"
            to: ""
            SequentialAnimation {
                NumberAnimation { property: "opacity"; duration: 1000 }
                ScriptAction {script: theGame.deleteObject()}
            }
       }
    ]


    function deleteObject () {
        console.log("DESTROY called on gameRect")
        theGame.destroy()
    }

/*
    Text {
        id: text1
        anchors.centerIn: parent
        text: "Exit"
        font.pointSize: 8
    }
*/

    /*
    Create buttons inside a Row with a Repeater and
    start the buttons animation (inside tge Row) WHEN the "theGame" rectangles
    opacity is 1
    check:http://stackoverflow.com/questions/28296343/how-to-move-animate-components-created-by-repeater-in-qml
      */

    //TESTING ->
    Row {
        anchors.centerIn: parent
        z: 4
        property var word: ['H','e','l','l','o','!']
        id: row
        Repeater {
            id: repeater
            model: row.word.length
            delegate: Button {
                id: delegate;
                width: theGame.width/6
                height: parentHeight/6
                property int pos
                property color releasedColor: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                color: mouseB.pressed ? pressedColor : releasedColor;
                Text {
                    anchors.centerIn: parent
                    font.pixelSize: parentHeight/16// 36
                    color: "white"
                    text: row.word[index]
                }

                Behavior on x {
                    ParallelAnimation {
                        PropertyAnimation {
                            duration: 500
                            easing.type: Easing.InOutBack
                        }
                        SequentialAnimation {
                            PropertyAnimation {
                                target: delegate
                                property: "y"
                                from: 0
                                to: delegate.pos == 1 ? 20 : -20
                                duration: 250
                            }
                            PropertyAnimation {
                                target: delegate
                                property: "y"
                                from: delegate.pos == 1 ? 20 : -20
                                to: 0
                                duration: 250
                            }
                        }
                    }
                }
                Behavior on rotation {
                    RotationAnimation {
                        direction: RotationAnimation.Clockwise
                        duration: 300
                    }
                }
                onButtonClicked: {console.log("GAME BUTTON CLICKED")}
                /*MouseArea {
                    anchors.fill: delegate
                    hoverEnabled: true
                    onEntered: {console.log("GAME BUTTON")}
                    onClicked: {

                    }
                }*/
            }
        }
    }

    Timer {
        id: gameTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var element1 = repeater.itemAt(Math.round(Math.random() * (repeater.count - 1)));
            var element2 = repeater.itemAt(Math.round(Math.random() * (repeater.count - 1)));
            if(element1 === element2) {
                element1.rotation = element1.rotation + 90;
            } else {
                element1.pos = 1;
                element2.pos = 2;
                var temp = element1.x;
                element1.x = element2.x;
                element2.x = temp;
            }
        }
        //For testing
        onRunningChanged: {
            if(!running) {
                console.log("Destroying gameRect...");
            }
        }
    }

    //<- TESTING



/*
    Grid {
        id: buttons
        anchors.topMargin: 30
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        spacing: 15
        z:1
        /*
        populate: Transition {
            NumberAnimation { properties: "x,y"; from: 0;
                duration: 1500; easing.type: Easing.OutBounce }
        }


        Button {
            id: button1
            width: rootForm.width/4
            color: "red"
            onButtonClicked: {}
        }
        Button {
            id: button2
            color: "red"
            width: rootForm.width/4
        }
        Button {
            id: button3
            color: "red"
            width: rootForm.width/4
        }
    }
*/
    MouseArea {
        id: mouse1
        anchors.fill: parent
        onClicked: {
            //buttonClicked();
            theGame.state = ""
            gameTimer.running = false
        }
    }

}
