// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Shapes 1.12   // use 1.12+ (works on Qt 5.12/5.15)

// ApplicationWindow {
//     visible: true
//     width: 340; height: 400
//     color: "#F1F3F7"
//     title: "Arc Slider (semi-circle)"

//     Item {
//         id: slider
//         anchors.centerIn: parent
//         width: 200; height: 200

//         // Public API
//         property real from: 16
//         property real to: 30
//         property real value: 26
//         property real stepSize: 1

//         // Look & feel
//         property color trackColor: "#CACDD3"
//         property color progressColor: "#4F75FF"
//         property color handleColor: "white"
//         property real strokeWidth: 16

//         property real arcStart: 150
//         property real arcSweep: 240

//         // Geometry
//         readonly property real cx: width/2
//         readonly property real cy: height - 8
//         readonly property real r: Math.min(width, height*2)/2 - strokeWidth*1.2
//         property real hitSlop: 6          // tolerance around the ring (px)

//         function clamp(v, lo, hi) { return Math.max(lo, Math.min(hi, v)); }
//         function norm(v) { return (v - from) / (to - from); }
//         function denorm(t) { return from + t*(to - from); }
//         function deg2rad(a) { return a * Math.PI / 180; }
//         function rad2deg(a) { return a * 180 / Math.PI; }
//         function angleForValue(v) { return arcStart + norm(v)*arcSweep; }
//         function pointOnArc(aDeg) {
//             var a = deg2rad(aDeg);
//             return Qt.point(cx + r*Math.cos(a), cy + r*Math.sin(a));
//         }
//         function unwrapAngle(angleDeg, referenceDeg) {
//             var a = angleDeg;
//             while (a - referenceDeg > 180) a -= 360;
//             while (a - referenceDeg < -180) a += 360;
//             return a;
//         }
//         // --- NEW: arc hit test (ring thickness + angle range) ---
//         function isOnArc(px, py) {
//             // radial ring check
//             var dx = px - cx, dy = py - cy;
//             var dist = Math.sqrt(dx*dx + dy*dy);
//             var inner = r - strokeWidth/2 - hitSlop;
//             var outer = r + strokeWidth/2 + hitSlop;
//             if (dist < inner || dist > outer) return false;

//             // angle check (handles wrap by unwrapping near arc midpoint)
//             var ang = rad2deg(Math.atan2(dy, dx));           // [-180..180]
//             var mid = arcStart + arcSweep/2;
//             var a = unwrapAngle(ang, mid);

//             var a0 = Math.min(arcStart, arcStart + arcSweep);
//             var a1 = Math.max(arcStart, arcStart + arcSweep);
//             return (a >= a0 && a <= a1);
//         }

//         // BACK TRACK
//         Shape {
//             anchors.fill: parent
//             ShapePath {
//                 strokeWidth: slider.strokeWidth
//                 strokeColor: slider.trackColor
//                 capStyle: ShapePath.RoundCap
//                 fillColor: "transparent"
//                 PathAngleArc {
//                     centerX: slider.cx; centerY: slider.cy
//                     radiusX: slider.r;  radiusY: slider.r
//                     startAngle: slider.arcStart
//                     sweepAngle: slider.arcSweep
//                 }
//             }
//         }

//         // PROGRESS ARC
//         Shape {
//             anchors.fill: parent
//             ShapePath {
//                 strokeWidth: slider.strokeWidth
//                 strokeColor: slider.progressColor
//                 capStyle: ShapePath.RoundCap
//                 fillColor: "transparent"
//                 PathAngleArc {
//                     centerX: slider.cx; centerY: slider.cy
//                     radiusX: slider.r;  radiusY: slider.r
//                     startAngle: slider.arcStart
//                     sweepAngle: slider.angleForValue(slider.value) - slider.arcStart
//                 }
//             }
//         }

//         // THUMB
//         Rectangle {
//             id: thumb
//             readonly property real a: slider.angleForValue(slider.value)
//             readonly property point p: slider.pointOnArc(a)
//             width: slider.strokeWidth * 1.1
//             height: width
//             radius: width/2
//             x: p.x - width/2
//             y: p.y - height/2
//             color: slider.handleColor
//             border.color: "#00000022"
//             border.width: 1
//             layer.enabled: true
//             layer.samples: 4
//             z: 3
//             Rectangle {
//                 width: parent.width*0.22
//                 height: width*0.5
//                 radius: width/2
//                 anchors.centerIn: parent
//                 y: -parent.height*0.18
//                 rotation: thumb.a + 90
//                 color: "#C9CEDA"
//             }
//         }

//         // VALUE (optional)
//         Text {
//             anchors.horizontalCenter: parent.horizontalCenter
//             anchors.top: parent.top
//             anchors.topMargin: 8
//             text: Math.round(slider.value)
//             font.pixelSize: 26
//             font.bold: true
//             color: "#1E1F22"
//             opacity: 0.9
//         }

//         // --- ARC-ONLY MOUSE AREA ---
//         MouseArea {
//             id: arcMA
//             anchors.fill: parent
//             hoverEnabled: true
//             acceptedButtons: Qt.LeftButton
//             preventStealing: true

//             property bool startedOnArc: false

//             cursorShape: containsMouse && slider.isOnArc(mouseX, mouseY)
//                          ? Qt.PointingHandCursor : Qt.ArrowCursor

//             onPressed: {
//                 startedOnArc = slider.isOnArc(mouse.x, mouse.y);
//                 if (!startedOnArc) { mouse.accepted = false; return; }
//                 updateFrom(mouse);
//             }
//             onPositionChanged: if (pressed && startedOnArc) updateFrom(mouse)
//             onReleased: startedOnArc = false

//             function updateFrom(m) {
//                 // Only update while on the arc ring
//                 if (!slider.isOnArc(m.x, m.y)) return;

//                 var dx = m.x - slider.cx;
//                 var dy = m.y - slider.cy;
//                 var ang = slider.rad2deg(Math.atan2(dy, dx));    // [-180..180]
//                 var ref = slider.arcStart + slider.arcSweep * 0.5;
//                 var a = slider.unwrapAngle(ang, ref);

//                 var a0 = slider.arcStart, a1 = slider.arcStart + slider.arcSweep;
//                 if (a1 < a0) { var t=a0; a0=a1; a1=t; }
//                 var aClamped = Math.max(a0, Math.min(a1, a));

//                 var tNorm = (aClamped - slider.arcStart) / slider.arcSweep;
//                 var v = slider.denorm(tNorm);
//                 if (slider.stepSize > 0)
//                     v = Math.round(v / slider.stepSize) * slider.stepSize;

//                 slider.value = slider.clamp(v, slider.from, slider.to);
//             }
//         }

//         Behavior on value { NumberAnimation { duration: 120; easing.type: Easing.OutCubic } }
//     }
// }



import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Shapes 1.9

Window {
    width: 400
    height: 400
    visible: true
    color: "#f0f0f0"
    title: qsTr("Thermostat Dial")

    property real minTemp: 16
    property real maxTemp: 30
    property real minAngle: 135
    property real maxAngle: 405

    property real currentAngle: 270
    property real temperature: minTemp + (maxTemp - minTemp) * ((currentAngle - minAngle) / (maxAngle - minAngle))

    Rectangle {
        id: dial
        anchors.centerIn: parent
        width: 250
        height: 250
        color: "transparent"

        Shape {
            id: backgroundArc
            anchors.fill: parent
            ShapePath {
                strokeWidth: 15
                strokeColor: "#ddd"
                capStyle: ShapePath.RoundCap
                fillColor: "transparent"
                PathAngleArc {
                    centerX: dial.width / 2
                    centerY: dial.height / 2
                    radiusX: dial.width / 2
                    radiusY: dial.height / 2
                    startAngle: minAngle
                    sweepAngle: maxAngle - minAngle
                }
            }
        }

        Shape {
            id: activeArc
            anchors.fill: parent
            ShapePath {
                strokeWidth: 15
                strokeColor: "#4A90E2"
                capStyle: ShapePath.RoundCap
                fillColor: "transparent"
                PathAngleArc {
                    centerX: dial.width / 2
                    centerY: dial.height / 2
                    radiusX: dial.width / 2
                    radiusY: dial.height / 2
                    startAngle: minAngle
                    sweepAngle: currentAngle - minAngle
                }
            }
        }

        Rectangle {
            id: knob
            width: 20
            height: 20
            radius: width / 2
            color: "#4A90E2"

            x: dial.width / 2 + Math.cos(currentAngle * Math.PI / 180) * (dial.width / 2) - width / 2
            y: dial.height / 2 + Math.sin(currentAngle * Math.PI / 180) * (dial.height / 2) - height / 2
        }


        Text {
            text: Math.round(temperature) + " °C"
            anchors.centerIn: parent
            font.pixelSize: 36
            font.bold: true
            color: "#333"
        }
        Text {
            text: "COOL"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 40
            font.pixelSize: 16
            color: "#777"
        }



        MouseArea {
            anchors.fill: parent
            onPositionChanged: {
                var dx = mouse.x - dial.width / 2
                var dy = mouse.y - dial.height / 2
                var angle = Math.atan2(dy, dx) * 180 / Math.PI
                angle = (angle < 0) ? angle + 360 : angle

                if (angle >= minAngle && angle <= maxAngle) {
                    currentAngle = angle
                    temperature = minTemp + (maxTemp - minTemp) * ((currentAngle - minAngle) / (maxAngle - minAngle))
                }
            }
        }
    }
}




// import QtQuick 2.15
// import QtQuick.Window 2.15
// import QtQuick.Controls
// import QtQuick.Shapes 1.9

// Window {
//     width: 640
//     height: 480
//     visible: true
//     title: qsTr("Thermostat")
//     property int temperature: 26  // start temperature
//     property int minTemp: 16
//     property int maxTemp: 32

//     // Map temperature to sweep angle (min 15° to max 270°)
//     property real minSweep: 15
//     property real maxSweep: 270
//     property real angleStep: (maxSweep - minSweep) / (maxTemp - minTemp)

//     Rectangle {
//         id: root
//         width: parent.width / 1.1
//         height: parent.height / 1.5
//         anchors.centerIn: parent
//         color: "transparent"

//         Rectangle {
//             id: innerRect
//             width: root.width * 0.5
//             height: root.height * 0.5
//             anchors.centerIn: parent
//             color: "pink"
//             clip: true

//             Shape {
//                 id: myShape
//                 width: parent.width / 2.5
//                 height: parent.height / 1.5
//                 anchors.centerIn: parent

//                 // Base arc
//                 ShapePath {
//                     strokeWidth: 15
//                     strokeColor: "RoyalBlue"
//                     fillColor: "transparent"
//                     capStyle: ShapePath.RoundCap
//                     PathAngleArc {
//                         centerX: myShape.width / 2
//                         centerY: myShape.height / 2
//                         radiusX: myShape.width / 2
//                         radiusY: myShape.height / 2
//                         startAngle: 140
//                         sweepAngle: 260
//                     }
//                 }

//                 // Dynamic arc (yellow)
//                 ShapePath {
//                     strokeWidth: 15
//                     capStyle: ShapePath.RoundCap
//                     strokeColor: "yellow"
//                     fillColor: "transparent"
//                     PathAngleArc {
//                         id: outerArc
//                         centerX: myShape.width / 2
//                         centerY: myShape.height / 2
//                         radiusX: myShape.width / 2
//                         radiusY: myShape.height / 2
//                         startAngle: 135
//                         sweepAngle: minSweep + (temperature - minTemp) * angleStep
//                     }
//                 }

//                 // Knob positioned using rotation transform (no Math!)
//                 Rectangle {
//                     id: knob
//                     width: 20
//                     height: 20
//                     radius: width / 2
//                     color: "black"
//                     x: myShape.width / 2 + myShape.width / 2 - width / 2
//                     y: myShape.height / 2 - height / 2

//                     transform: Rotation {
//                         origin.x: myShape.width / 2
//                         origin.y: myShape.height / 2
//                         angle: outerArc.startAngle + outerArc.sweepAngle
//                     }
//                 }

//                 // +, temperature, - buttons
//                 Row {
//                     anchors.centerIn: parent
//                     spacing: 12

//                     // + button
//                     Rectangle {
//                         width: 30
//                         height: 30
//                         radius: width / 2
//                         color: "#4A90E2"
//                         Text {
//                             text: "+"
//                             anchors.centerIn: parent
//                             color: "white"
//                             font.bold: true
//                         }
//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 if (temperature < maxTemp) {
//                                     temperature++
//                                 }
//                             }
//                         }
//                     }

//                     // Temperature display
//                     Rectangle {
//                         width: 60
//                         height: 30
//                         radius: 15
//                         color: "transparent"
//                         border.width: 1
//                         border.color: "#666"
//                         Text {
//                             text: temperature + " °C"
//                             anchors.centerIn: parent
//                             font.bold: true
//                         }
//                     }

//                     // - button
//                     Rectangle {
//                         width: 30
//                         height: 30
//                         radius: width / 2
//                         color: "#4A90E2"
//                         Text {
//                             text: "-"
//                             anchors.centerIn: parent
//                             color: "white"
//                             font.bold: true
//                         }
//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 if (temperature > minTemp) {
//                                     temperature--
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }

