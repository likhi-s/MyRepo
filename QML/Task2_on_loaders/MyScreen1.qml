import QtQuick 2.15
import QtQuick.Controls


Rectangle
{
    id: myscreen1
    width: 200
    height: 100
    color: "pink"
    anchors.centerIn: parent


    Component.onCompleted:
    {
        console.log("MyScreen1 Constructed")

    }
    Component.onDestruction:
    {
        console.log("MyScreen1 Destructed")

    }
}
