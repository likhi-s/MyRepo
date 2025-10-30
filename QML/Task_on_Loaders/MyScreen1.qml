import QtQuick 2.15
import QtQuick.Controls


Rectangle
{
    id: myscreen1
    width: 200
    height: 100
    color: "pink"
    anchors.centerIn: parent

    signal myScreen1NextClicked()

    Button
    {
        id: prevBtn
        text: "PrevBtn"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked:
        {
            console.log("Prev button clicked")
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
            console.log("@@@@Next button clicked")
            myScreen1NextClicked()
            //screen1Loader.source = "MyScreen2.qml"

        }
    }

    Component.onCompleted:
    {
        console.log("MyScreen1 Constructed")

    }
    Component.onDestruction:
    {
        console.log("MyScreen1 Destructed")

    }
}
