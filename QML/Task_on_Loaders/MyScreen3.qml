import QtQuick 2.15
import QtQuick.Controls

Rectangle
{
    id: myscreen
    width: 200
    height: 100
    color: "yellow"
    anchors.centerIn: parent

    signal myScreen3PrevClicked()
    signal myScreen3NextClicked()
    Button
    {
        id: prevBtn
        text: "PrevBtn"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked:
        {
            console.log("Prev button clicked")
            myScreen3PrevClicked()
        }
    }
    Button
    {
        id: nextBtn
        text: "NextBtn"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        onClicked:
        {
            console.log("Next button clicked")
            myScreen3NextClicked()

        }
    }
    Component.onCompleted:
    {
        console.log("MyScreen3 Constructed")

    }
    Component.onDestruction:
    {
        console.log("MyScreen3 Destructed")

    }


}
