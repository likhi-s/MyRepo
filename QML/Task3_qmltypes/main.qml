import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle
    {
        id:rect1
        width: 300
        height: 300
        color: "pink"

        Rectangle
        {
            id:rect2
            color: "green"
            anchors.top:rect1.top
            anchors.left: rect1.left
            anchors.right:rect1.horizontalCenter
            anchors.bottom: rect1.verticalCenter
            anchors.margins: 10
        }
        Rectangle
        {
            id:rect3
            color: "blue"
            anchors.top:rect1.top
            anchors.left: rect1.horizontalCenter
            anchors.right:rect1.right
            anchors.bottom: rect1.verticalCenter

            anchors.leftMargin: 10

        }
    }

    /*Rectangle
    {
        id:rect1
        width: 100
        height: 100
        color: "pink"
    }
    Item
    {
        id:item1
        width: 100
        height: 100
        visible: true
        anchors.top: rect1.bottom
        anchors.left: rect1.right

        // Rectangle
        // {
        //     anchors.fill: parent
        //     color: "lightblue"
        // }
    }
    Image {
        id: qmlImage
        width: 100
        height: 100
        source: "file:///home/likhitha/Pictures/qml.png"

        anchors.top: item1.bottom
        anchors.left: item1.right

    }
    TextInput
    {
        id:textInput1
        text:"TextInput"
        font.pixelSize: 25
        color: "purple"

        anchors.top: qmlImage.bottom
        anchors.left: qmlImage.right
    }
    TextEdit
    {
        id: textedit1
        text: "TextEdit"
        font.pixelSize: 25
        color: "blue"

        anchors.top: textInput1.bottom
        anchors.left: textInput1.right
    }
    Text
    {
        id: text1
        text: qsTr("Text")
        color: "green"
        font.pixelSize: 25

        anchors.top: textedit1.bottom
        anchors.left: textedit1.right

    }
    Button
    {
        id:button1
        text:"Button"
        enabled: false

        anchors.top: text1.bottom
        anchors.left: text1.right
    }
    RadioButton
    {
        id: radioButton1
        text: "Radio Button"
        checked:  true

        anchors.top: button1.bottom
        anchors.left: button1.right
    }
    ProgressBar
    {
        id: progressbar1
       from: 0
       to: 100
       value: 50
       anchors.top: radioButton1.bottom
       anchors.left: radioButton1.right
    }
    Slider
    {
       id:slider1
       from: 0
       to: 100
       value:50
       orientation: Qt.Vertical

       anchors.top: progressbar1.bottom
       anchors.left: progressbar1.right
    }*/



}

