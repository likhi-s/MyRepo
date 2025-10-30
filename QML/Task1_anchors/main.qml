import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: win
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle
    {
        id: rect1
        width: 206
        height: 112
        color: "green"
    }
    Rectangle
    {
        id: rect2
        width: 206
        height: 112
        color: "blue"
        anchors.left: rect1.right
        anchors.top: rect1.bottom
    }
    Rectangle
    {
        id: rect3
        width: 206
        height: 112
        color: "yellow"
        anchors.left: rect2.right
        anchors.top: rect2.bottom
    }
    Rectangle
    {
        id: rect4
        width: 206
        height: 112
        color: "pink"
        anchors.left: rect3.right
        anchors.top: rect3.bottom
    }
    Rectangle
    {
        id: rect5
        width: 206
        height: 112
        color: "green"
        anchors.left: rect4.right
        anchors.top: rect4.bottom
    }
    Rectangle
    {
        id: rect6
        width: 206
        height: 112
        color: "blue"
        anchors.left: rect5.right
        anchors.top: rect5.bottom
    }
    Rectangle
    {
        id: rect7
        width: 206
        height: 112
        color: "yellow"
        anchors.left: rect6.right
        anchors.top: rect6.bottom
    }
    Rectangle
    {
        id: rect8
        width: 206
        height: 112
        color: "pink"
        anchors.left: rect7.right
        anchors.top: rect7.bottom
    }
    Rectangle
    {
        id: rect9
        width: 205
        height: 113
        color: "black"
        anchors.left: rect8.right
        anchors.top: rect8.bottom
    }
}
