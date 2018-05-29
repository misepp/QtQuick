import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    height: 600
    width: 600

   MainForm {
        anchors.fill: parent
        color: "lightblue"
        property real effectiveOpacity: 1.0
        property string person: ""
        property int points: dataStorage.Points
        id: rootForm


        function preservePersonData(name) {
            person = name
            console.log("NIMI TALLESSA: " + person)
        }
        function storeData(name, points) {
            console.log("storeData: " + dataStorage.saveData(name, points))
        }

        Text {
            id: headerText
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "MENU"
            font.bold: true
            font.pointSize: 18
        }

        Column {
            id: buttons
            anchors.top: headerText.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            populate: Transition {
                NumberAnimation { properties: "x,y"; from: 0;
                    duration: 1500; easing.type: Easing.OutBounce }
                /*ParallelAnimation {
                    NumberAnimation { target: button1; property: "x"; from: 0
                        duration: 1500; easing.type: Easing.OutBounce }
                    NumberAnimation {target: button1; property: "y"; from: rootForm.height;
                        duration: 1500; easing.type: Easing.OutBounce }
                    NumberAnimation { target: button2; property: "x"; from: rootForm.width;
                        duration: 1500; easing.type: Easing.OutBounce }
                    NumberAnimation {target: button2; property: "y"; from: rootForm.height/2;
                        duration: 1500; easing.type: Easing.OutBounce }
                    NumberAnimation { target: button3; property: "x"; from: -100
                        duration: 1500; easing.type: Easing.OutBounce }
                    NumberAnimation {target: button3; property: "y"; from: rootForm.height;
                        duration: 1500; easing.type: Easing.OutBounce }
                }*/
            }
            move: Transition {
                NumberAnimation { properties: "y"; easing.type: Easing.OutQuad }
            }

            Button {
                id: button1
                width: rootForm.width-60

                Behavior on rotation {
                    SpringAnimation { duration: 1000; spring: 1; damping: 0.2 }
                }
                buttonText: "Go to Game!"

                onButtonClicked: {
                    //rotation += 360;
                    //rootForm.state="showView"
                    var component = Qt.createComponent("MyView.qml");
                    var object = component.createObject(rootForm,
                                                        {
                                                        "z": 2,
                                                        /*"x": rootForm.width,*/
                                                        "anchors.fill": rootForm,
                                                        "width": rootForm.width,
                                                        "height": rootForm.height
                                                        });
                    //console.log("CONTEXT property says: " + dataStorage.saveData(rootForm.person));
                    //console.log("Saved name is: " + rootForm.person)
                    object.state = "showView";
                    console.log("X after SHOW: " + object.x)
                    //dataStorage.setPoints(dataStorage.getPoints() + 5);
                    console.log("POINTS when starting the game: " + dataStorage.Points);
                }
            }

            Button {
                id: button2
                width: rootForm.width-60
                visible: opacity != 0
                opacity: rootForm.effectiveOpacity

                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }

                buttonText: "Hide me!"

                onButtonClicked: { rootForm.effectiveOpacity = (rootForm.effectiveOpacity == 1.0 ? 0.0 : 1.0); }
            }
            Button {
                id: button3
                width: rootForm.width-60
                buttonText: "Hide the 'Hide me button'"

                onButtonClicked: {
                    console.log("BUTTON");
                    rootForm.effectiveOpacity = (rootForm.effectiveOpacity == 1.0 ? 0.0 : 1.0); }

                states: [
                    State {
                        id: show
                        when: rootForm.effectiveOpacity == 0.0
                        PropertyChanges {
                            target: button3
                            buttonText: "Show the 'Hide me button'"
                        }
                    },
                    State {
                        id: hide
                        when: rootForm.effectiveOpacity == 1.0
                        PropertyChanges {
                            target: button3
                            buttonText: "Hide the 'Hide me button'"
                    }
                }
                ]
                transitions:
                    Transition {
                        PropertyAnimation { property: "buttonText"; duration: 1000 }
                    }
            }
            Button {
                id: button4
                width: rootForm.width-60
                buttonText: "Sing in"

                onButtonClicked: {
                    var component = Qt.createComponent("Input.qml");
                    var object = component.createObject(rootForm,
                                                        {
                                                        "z": 2,
                                                        /*"x": rootForm.width,*/
                                                        "anchors.top": buttons.bottom,
                                                        "anchors.topMargin": 30/*,
                                                        "anchors.horizontalCenter": buttons.horizontalCenter,
                                                        "width": rootForm.width,
                                                        "height": rootForm.height/5*/
                                                        });
                //dataStorage.setPoints(5);
                //dataStorage.setPoints(dataStorage.getPoints() + 5);
                console.log("CONTEXT POINTS: " + rootForm.points);
                }
            }
        }
        CloseButton {
            id: close
            anchors.right: parent.right
            anchors.bottom:  parent.bottom
            onButtonClicked: { Qt.quit() }
        }

    }
}
