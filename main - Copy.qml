import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    height: 600
    width: 600

   MainForm {
        anchors.fill: parent
        //height: rekti.height
        //width: rekti.width
        mouseArea.onClicked: {
            //Qt.quit();
            //animateColor.start()
            changeState()
            printSize()
        }
        id: rootForm
        color: "red"
        state: "RELEASED"

        //PropertyAnimation {id: animateColor; target: rootForm; properties: "color"; to: "green"; duration: 1000}

        states: [
            State {
                name: "PRESSED"
                PropertyChanges { target: rootForm; color: "green"}
            },
            State {
                name: "RELEASED"
                PropertyChanges { target: rootForm; color: "red"}
            }
        ]

        transitions: [
            Transition {
                from: "PRESSED"
                to: "RELEASED"
                PropertyAnimation {target: rootForm; properties: "color"; to: "red"; duration: 1000}

            },
            Transition {
                from: "RELEASED"
                to: "PRESSED"
                PropertyAnimation {target: rootForm; properties: "color"; to: "green"; duration: 1000}
            }
        ]

        function printSize() {
            console.log("WIDTH: " + rootForm.width)
            console.log("HEIGHT: " + rootForm.height)
        }

        function changeState() {
            if(rootForm.state === "PRESSED") {
                console.log("getState12() PRESSED")
                rootForm.state = "RELEASED"
            }
            else {
                console.log("ELSE")
                rootForm.state = "PRESSED"
            }
        }

        Column {
            id: buttons
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15
            z: 10

            Button {
                id: button1
                width: rootForm.width-60
                pressedColor: "yellow"

                Behavior on rotation {
                    SpringAnimation { duration: 1000; spring: 1; damping: 0.2 }
                }
                buttonText: "Switch to MyView!"

                onButtonClicked: {
                    //rotation += 360;
                    console.log(testProp.testFucntion(10))
                }
            }


            Button {
                id: button2
                width: rootForm.width-60
                Behavior on rotation {
                    SpringAnimation { duration: 1000; spring: 1; damping: 0.2 }
                }
                buttonText: "Switch to MyView!"

                onButtonClicked: {
                    console.log(rotation)
                    /*if(rotation == 0) {
                        rotation += 360
                    }
                    else {
                        var rot = -(rotation - 360)
                        rotation += rot
                    }*/
                    //rotation += 360;

                }
/*
                states: State {
                    when: button2.mous.pressed
                    PropertyChanges { target: button2; myX: x+2; myY: y+2;}
                }*/
            }
        }
/*
        NumberAnimation {
            id: animateOpacity
            target: rekti
            properties: "opacity"
            from: 0.99
            to: 1.0
            loops: Animation.Infinite
            easing {type: Easing.OutBack; overshoot: 500}
       }
       */
    }
}
