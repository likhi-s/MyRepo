import QtQuick 2.15
Row {
    spacing: 10
    property alias checkBoxText: checkboxText.text
    property bool checkstate: false

    Rectangle {
        id: rect1
        width: 25
        height: 25
        color: "yellow"

        Image {
            width: 15
            height: 15
            anchors.centerIn: parent
            source: "Images/check.png"
            visible: checkstate
        }

        MouseArea {
            anchors.fill: parent
            onClicked:
            {

                checkstate = !checkstate
            }
        }
    }

    Text {
        id: checkboxText
        text: "text"

        MouseArea {
            anchors.fill: parent
            onClicked:
            {

                checkstate = !checkstate
            }
        }
    }

}
