import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {

        width: 500; height: 200
        color:"yellow"
        anchors.centerIn: parent
        clip:true

        ListModel
        {
            id: imageModel
            ListElement { text: "music";   source: "Images/music.svg" }
            ListElement { text: "Arrive";  source: "Images/arrive.svg" }
            ListElement { text: "morning"; source: "Images/morning.svg" }
            ListElement { text: "movie";   source: "Images/movie.svg" }
            ListElement { text: "night";   source: "Images/night.svg" }
            ListElement { text: "sleep";   source: "Images/sleep.svg" }
            ListElement { text: "walking"; source: "Images/walking.svg" }

        }
        Component {
            id: delegate
            Row
            {
                id:row
                spacing:10

                opacity: PathView.isCurrentItem ? 1 : 0.5
                Rectangle
                {
                    id:rect1
                    width:50

                   height: (index === pathview.currentExpandedIndex) ? 85 : 50
                    color: (index === pathview.currentExpandedIndex) ? "light gray" : "white"
                    radius:25
                    border.color: "light gray"
                    border.width:1
                    property bool expanded: false



                    Column {
                        anchors.horizontalCenter: parent.horizontalCenter


                        Image {
                            id: image
                            anchors.horizontalCenter: nameText.horizontalCenter
                            width: 55
                            height: 55
                            source: model.source
                            fillMode: Image.PreserveAspectFit


                        }
                        Text {
                            id: nameText
                            text: model.text
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignHCenter
                        }

                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            if (row.opacity === 1) {
                                if (pathview.currentExpandedIndex === index) {
                                    pathview.currentExpandedIndex = -1


                                } else {
                                    pathview.currentExpandedIndex = index

                                }
                            }
                        }
                        Component.onCompleted:
                        {
                            console.log("pathview.currentExpandedIndex :"+pathview.currentExpandedIndex )
                            console.log("index :"+ index)
                        }
                    }
                }
            }
        }


        PathView {
            id: pathview
            anchors.fill: parent
            model:imageModel
            pathItemCount: 5
            preferredHighlightBegin:0.5
            preferredHighlightEnd:0.5
            highlightRangeMode:PathView.StrictlyEnforceRange
              property int currentExpandedIndex: -1

            delegate: delegate
            focus: true
            path:  Path {
                startX:0; startY: 100
                PathLine { x:500; y: 100 }
            }
        }

    }
}

/*import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 500; height: 200
        color:"yellow"
        anchors.centerIn: parent
        clip:true

        ListModel
        {
            id: imageModel
            ListElement { text: "music";   source: "Images/music.svg" }
            ListElement { text: "Arrive";  source: "Images/arrive.svg" }
            ListElement { text: "morning"; source: "Images/morning.svg" }
            ListElement { text: "movie";   source: "Images/movie.svg" }
            ListElement { text: "night";   source: "Images/night.svg" }
            ListElement { text: "sleep";   source: "Images/sleep.svg" }
            ListElement { text: "walking"; source: "Images/walking.svg" }
            ListElement { text: "music";   source: "Images/music.svg" }
            ListElement { text: "Arrive";  source: "Images/arrive.svg" }
            ListElement { text: "morning"; source: "Images/morning.svg" }
            ListElement { text: "movie";   source: "Images/movie.svg" }
            ListElement { text: "night";   source: "Images/night.svg" }
            ListElement { text: "sleep";   source: "Images/sleep.svg" }
            ListElement { text: "walking"; source: "Images/walking.svg" }

        }
        Component {
            id: delegate
            Row
            {
                spacing:10

                opacity: PathView.isCurrentItem ? 1 : 0.5

                Column {



                    Image {
                        id: image
                        anchors.horizontalCenter: nameText.horizontalCenter
                        width: 55
                        height: 55
                        source: model.source
                        fillMode: Image.PreserveAspectFit


                    }
                    Text {
                        id: nameText
                        text: model.text
                        font.pointSize: 12
                        horizontalAlignment: Text.AlignHCenter
                    }

                }
            }
        }
        Component.onCompleted:
        {
            console.log("Path Item :" +pathview.pathItemCount)
        }

        PathView {
            id: pathview
            anchors.fill: parent
            model:imageModel
            pathItemCount: 5
            preferredHighlightBegin:0.5
            preferredHighlightEnd:0.5

            // highlightRangeMode:PathView.NoHighlightRange
            // highlightRangeMode:PathView.ApplyRange
            highlightRangeMode:PathView.StrictlyEnforceRange

            delegate: delegate
            focus: true
            path:  Path {
                startX:0; startY: 100
                PathLine { x:500; y: 100 }
            }
        }

    }
}*/

