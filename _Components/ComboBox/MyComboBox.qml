
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: comboBox
    width: 200
    height: 30
    color: "black"
    radius: 5
    property alias iconImageSource: iconImage.source
    property alias  iconImageWidth: iconImage.width
    property alias iconImageheight: iconImage.height

    property var customModel: []
    property string currentText: "Select Country"
    property alias comboBoxText : defaultText.text
    property alias comboTextColor : defaultText.color
    property alias comboFontPixelSize:  defaultText.font.pixelSize

    Text {
        id: defaultText
        text: comboBox.currentText
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: 5
        font.pixelSize: 18
    }

    Image {
        id: iconImage
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
        width: 18
        height: 16
        source: "Images/DownwardArrow.png"
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            myListView.visible = true
        }
    }

    ListView {
        id: myListView
        width: parent.width
        height: parent.height-20
        model: customModel
        visible: false
        anchors.top: parent.bottom
        clip: true
        delegate: myComponent
    }
    Component
    {
        id:myComponent
        Rectangle {
            width: parent.width
            height: 30
            color: ListView.isCurrentItem ? "teal" : "black"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 5
                color: "white"
                text: COUNTRYNAME
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    comboBox.currentText = modelData
                    myListView.visible = false
                }
                hoverEnabled: true
                onEntered: parent.color = "teal"
                onExited: parent.color = "black"
            }
        }
    }
}
