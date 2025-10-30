import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls


Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Connections
    {
        target: myscreenLoader.item

        function onMyScreen1PrevClicked()
        {
            console.log("Received PreviousClicked from MyScreen1")
        }

        function onMyScreen1NextClicked()
        {
            console.log("Received nextClicked from MyScreen1")
            myscreenLoader.source = "MyScreen2.qml"
        }

        function onMyScreen2PrevClicked()
        {
            console.log("Received PreviousClicked from MyScreen2")
            myscreenLoader.source = "MyScreen1.qml"
        }

        function onMyScreen2NextClicked()
        {
            console.log("Received nextClicked from MyScreen2")
            myscreenLoader.source = "MyScreen3.qml"
        }

        function onMyScreen3PrevClicked()
        {
            console.log("Received PreviousClicked from MyScreen3")
            myscreenLoader.source = "MyScreen2.qml"
        }

        function onMyScreen3NextClicked()
        {
            console.log("Received nextClicked from MyScreen3")
            myscreenLoader.source = "MyScreen4.qml"
        }

        function onMyScreen4PrevClicked()
        {
            console.log("Received PreviousClicked from MyScreen4")
            myscreenLoader.source = "MyScreen3.qml"
        }

        function onMyScreen4NextClicked()
        {
            console.log("Received nextClicked from MyScreen4")
        }

    }


    Loader
    {
        id: myscreenLoader
        source: "MyScreen1.qml"
        anchors.fill: parent
    }

}



