import QtQuick 2.15
import QtQuick.Controls

Rectangle
{
    id: myscreen
    width: 200
    height: 100
    color: "black"
    anchors.centerIn: parent


    Component.onCompleted:
    {
        console.log("MyScreen3 Constructed")
    }
    Component.onDestruction:
    {
        console.log("MyScreen3 Destructed")
    }
}
