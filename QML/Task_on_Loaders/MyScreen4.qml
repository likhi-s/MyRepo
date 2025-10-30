import QtQuick 2.15
import QtQuick.Controls

Rectangle
{
    id: myscreen
    width: 200
    height: 100
    color: "black"
    anchors.centerIn: parent

    signal myScreen4PrevClicked()
    signal myScreen4NextClicked()
    Button
    {
        id: prevBtn
        text: "PrevBtn"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked:
        {
            console.log("Prev button clicked")
            myScreen4PrevClicked()
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
            myScreen4NextClicked()

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
