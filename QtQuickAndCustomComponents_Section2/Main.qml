import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Common Qt Quick Object Types")

    Column {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 100
            height: 100
            color: "blue"
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "pink"
                }
                GradientStop {
                    position: 1.0
                    color: "red"
                }
            }
        }

        Rectangle {
            width: 100
            height: 100
            color: "lightblue"
            border.color: "black"
            radius: height
        }

        Item {
            width: 100
            height: 50

            Text {
                color: "blue"
                width: parent.width
                font.pixelSize: 22
                font.family: "Courier New"
                text: qsTr("This is a Text")
                wrapMode: Text.WordWrap
            }
        }

        Image {
            width: 100
            height: 100
            source: "qtLogo.png"
        }
    }
}
