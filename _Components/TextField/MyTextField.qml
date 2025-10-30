import QtQuick 2.15

Rectangle
{
    id: rect1
    width: 180
    height: 30
    radius: 5
    color: "black"
    clip:true
    border.color: rect1.color

    property alias backGroundColor : rect1.color
    property alias placeholderText : textedit.text
    property alias placeholderTextColor : textedit.color
    property alias textColor : textinput.color
    property alias font : textinput.font.pixelSize


    Text {
        id: textedit
        leftPadding: 5
        text: "placeHolder"
        color:"darkgray"
        font.pixelSize: 15
        visible: textinput.text.length===0
    }
    TextInput {
        id: textinput
        anchors.fill: parent
        leftPadding: 5
        color:"White"
        font.bold: false
        font.family: "Tahoma"
        font.italic: false
        font.pixelSize: 15

    }
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            textinput.focus = true
            rect1.border.color = "orange"
        }
    }

}
