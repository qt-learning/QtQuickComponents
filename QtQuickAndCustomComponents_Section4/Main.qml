import QtQuick

Window {
    width: 500
    height: 560
    visible: true
    title: qsTr("Defining Custom QML Object Types")

    Column {
        anchors.centerIn: parent
        spacing: 10

        MyComponent {
            width: 200
            height: 200
            frameColor: "lightgrey"
            imageUrl: "CuteCat.jpg"
            onCatClicked: function(sound) {
                console.log(sound)
            }
        }
    }

}
