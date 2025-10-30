import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    MyButton
    {

        id:myButton
        color: "Teal"
        buttonText: "Likhitha"
        textFontBold : true
        textFontFamily : "tahoma"
        onClicked:
        {
            console.log("My ButtonClicked")
        }
    }

}
