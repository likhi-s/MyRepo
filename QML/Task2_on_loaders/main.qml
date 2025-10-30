import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls


Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Row
    {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        MyButton
        {
            id:button1
            text: "button1"
            onClicked:
            {
                myButton.source = "MyScreen1.qml"
            }
        }
        MyButton
        {
            id:button2
            text: "button2"
            onClicked:
            {
                myButton.source = "MyScreen2.qml"
            }
        }
        MyButton
        {
            id:button3
            text: "button3"
            onClicked:
            {
                myButton.source = "MyScreen3.qml"
            }
        }
        MyButton
        {
            id:button4
            text: "button4"
            onClicked:
            {
                myButton.source = "MyScreen4.qml"
            }
        }
    }

    /*Connections
    {
        target: myButton.item

        function onMyButton1Clicked()
        {
            console.log("Button1 Clicked")
            myButton.source = "MyScreen1.qml"

        }
        function onMyButton2Clicked()
        {
            console.log("Button1 Clicked")
            myButton.source = "MyScreen2.qml"

        }
        function onMyButton3Clicked()
        {
            console.log("Button1 Clicked")
            myButton.source = "MyScreen3.qml"

        }
        function onMyButton4Clicked()
        {
            console.log("Button1 Clicked")
            myButton.source = "MyScreen4.qml"
        }

    }

    Row
    {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        MyButton
        {
            id:b1
            text: "b1"
        }
        MyButton
        {
            id:b2
            text: "b2"

        }
        MyButton
        {
            id:b3
            text: "b3"

        }
        MyButton
        {
            id:b4
            text: "b4"
        }

    }*/

    Loader
    {
       id: myButton
       source: "MyScreen1.qml"
       height: 200
       width:800
    }
}



