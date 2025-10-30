import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 600
    visible: true
    title: qsTr("Hello World")



    MyComboBox
    {
        customModel: ["likhitha","dharshini","varshini"]
        // customModel: Country
    }

}
