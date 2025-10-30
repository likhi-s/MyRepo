import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rect1
    width: 30
    height: 30
    radius: height/2
    color: "White"
    border.color:"light gray"

    Rectangle
    {
        id: innercircle
        anchors.centerIn: parent
        width: 20
        height: 20
        radius: height/2
        color: "black"
        border.color:"gray"
        visible: false
    }

    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            innercircle.visible = true
        }
    }
}
