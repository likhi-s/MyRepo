import QtQuick 2.15
import QtQuick.Controls

Rectangle
{
    id: myscreen
    width: 200
    height: 100
    color: "red"
    anchors.centerIn: parent

    signal myScreen2PrevClicked()
    signal myScreen2NextClicked()
    Button
    {
        id: prevBtn
        text: "PrevBtn"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked:
        {
            console.log("Prev button clicked")
            myScreen2PrevClicked()
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
            myScreen2NextClicked()

        }
    }
    Component.onCompleted:
    {
        console.log("MyScreen2 Constructed")

    }
    Component.onDestruction:
    {
        console.log("MyScreen2 Destructed")

    }


}
