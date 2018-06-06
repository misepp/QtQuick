import QtQuick 2.5

Rectangle {
    id: parentRect
    color: "yellow"
    width: parent.width
    height: parent.height/5

    Row {
        id: spacer
        anchors.centerIn: parent
        spacing: 50

        Rectangle {
            id: personRect
            border.color: "black"
            //anchors.top: parent.top
            width: parentRect.width/3
            height: personData.font.pixelSize+2
            //anchors.right: okButton.left
            anchors.verticalCenter: okButton.verticalCenter

            TextInput {
                id: personData
                anchors.fill: parent
                text: "Enter name here"
                cursorVisible: true
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                wrapMode: TextInput.Wrap
                font.pixelSize:  12

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.text = "";
                        parent.forceActiveFocus();
                    }
                }
            }
        }

        Button {
            id: okButton
            width: parentRect.width/4
            buttonText: "OK"

            //anchors.centerIn: parent

            onButtonClicked: {
                if(personData.text != "") {
                    parentRect.parent.storeData(personData.text, Math.floor((Math.random() * 100) + 1));
                    parentRect.parent.preservePersonData(personData.text);
                    personData.text = "";
                }
            }
        }
    }

    CloseButton {
        id: closeInput
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onButtonClicked: parentRect.destroy()
    }
}
