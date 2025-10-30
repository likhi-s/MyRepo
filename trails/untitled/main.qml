import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Shapes 1.9
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property int temperature : 32
    property int maxsweepAngle : 270
    property int minsweepAngle: 14
    property int _startAngle: 135
    property int sweepAngleRange :16
    property int arcWidth : 15

    Rectangle
    {
        id: root
        width: parent.width / 1.1
        height: parent.height / 1.5

        Rectangle {
            id: innerRect
            width: root.width * 0.5
            height: root.height * 0.5
            anchors.centerIn: parent
            color: "pink"
            clip: true


            Shape
            {
                id: myShape
                width: parent.width/2.5
                height: parent.height/1.5

                anchors.centerIn: parent

                ShapePath {
                    strokeWidth: arcWidth
                    strokeColor: "RoyalBlue"
                    fillColor: "transparent"
                    capStyle: ShapePath.RoundCap


                    PathAngleArc {
                        centerX: myShape.width /2
                        centerY: myShape.height / 2
                        radiusX: myShape.width / 2
                        radiusY: myShape.height / 2
                        startAngle: _startAngle
                        sweepAngle: maxsweepAngle

                    }
                }
                ShapePath {
                    id:outerArcShapePath
                    strokeWidth: arcWidth
                    capStyle: ShapePath.RoundCap

                    strokeColor: "yellow"
                    fillColor: "transparent"

                    PathAngleArc {

                        id: outerArc
                        centerX: myShape.width / 2
                        centerY: myShape.height / 2
                        radiusX: myShape.width / 2
                        radiusY: myShape.height / 2
                        startAngle: _startAngle
                        sweepAngle: maxsweepAngle
                    }

                }

                ShapePath {
                    id: node
                    strokeWidth: arcWidth
                    strokeColor: "white"
                    capStyle: ShapePath.RoundCap
                    PathAngleArc {
                        centerX: myShape.width / 2
                        centerY: myShape.height / 2
                        radiusX: myShape.width / 2
                        radiusY: myShape.height / 2
                        startAngle: _startAngle + outerArc.sweepAngle
                        sweepAngle: 0.1
                    }

                }



                Row
                {
                    anchors.centerIn: parent
                    spacing: 10
                    Rectangle
                    {
                        id: plusrect
                        width:20
                        height:20
                        radius:width/2


                        Text
                        {
                            text: "+"
                            anchors.centerIn: parent
                            font.pixelSize: 20

                            font.bold: true
                        }
                        MouseArea
                        {
                            anchors.fill : plusrect
                            onClicked:
                            {
                                if(outerArc.sweepAngle <maxsweepAngle )
                                {
                                    temperature++
                                    outerArc.sweepAngle = outerArc.sweepAngle + sweepAngleRange
                                }
                            }
                        }
                    }
                    Rectangle
                    {
                        width:20
                        height:20
                        radius:width/2
                        color :" transparent"
                        Text
                        {
                            text: temperature +" °C"
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle
                    {
                        id: minusRect
                        width:20
                        height:20
                        radius:width/2
                        Text
                        {
                            text: "-"
                            anchors.centerIn: parent
                            font.pixelSize: 20
                            font.bold: true
                        }
                        MouseArea
                        {
                            anchors.fill : minusRect
                            onClicked:
                            {
                                if(outerArc.sweepAngle >minsweepAngle )
                                {
                                    outerArc.sweepAngle = outerArc.sweepAngle - sweepAngleRange
                                    temperature--
                                }
                            }
                        }
                    }
                }
                MouseArea
                {
                    anchors.fill:myShape
                    onPositionChanged:
                    {
                        if(outerArc.sweepAngle <=270 && outerArc.sweepAngle >=15 && outerArc.startAngle <=390 &&outerArc.startAngle >=130 )
                        {
                            outerArc.sweepAngle = outerArc.sweepAngle -16
                            temperature--

                            console.log("sweepAngle : "+outerArc.sweepAngle )
                            console.log("startAngle : "+outerArc.startAngle)
                            console.log("mouse.x: "+mouse.x)
                            console.log("mouse.y: "+mouse.y)
                        }
                        else
                        {
                            temperature++
                            outerArc.sweepAngle = outerArc.sweepAngle + 16
                        }
                    }
                }
            }
        }

    }
}


