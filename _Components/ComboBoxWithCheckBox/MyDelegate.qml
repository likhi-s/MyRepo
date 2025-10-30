import QtQuick 2.15

Rectangle {
    width: parent.width
    height: 30
    color: ListView.isCurrentItem ? "teal" : "black"
    Row
    {
        spacing :8
        Rectangle {
            id: rect1
            width: 25
            height: 25
            color: "White"

            Image {
                width: 15
                height: 15
                anchors.centerIn: parent
                source: "Images/check.png"
                visible: checkstate
            }
            MouseArea {
                id: checkboxMouseArea
                width:parent.width
                height:parent.height
                onClicked:
                {
                    console.log("on Clicked")
                    checkstate = !checkstate
                }
            }

        }
        Text {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 5
            color: "white"
            text: COUNTRYNAME
            font.bold: currentText === COUNTRYNAME ? true: false
            font.pixelSize: 18
        }


    }
    Image {
        anchors.right: parent.right
        anchors.rightMargin: 5
        width:30
        height:30
        source: COUNTRYFLAG
        fillMode: Image.PreserveAspectFit
    }

}
