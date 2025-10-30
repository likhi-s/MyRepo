import QtQuick 2.15
import QtQuick.Controls

Rectangle
{
    id: myscreen
    width: 200
    height: 100
    color: "red"
    anchors.centerIn: parent


    Component.onCompleted:
    {
        console.log("MyScreen2 Constructed")
    }
    Component.onDestruction:
    {
        console.log("MyScreen2 Destructed")
    }
}
