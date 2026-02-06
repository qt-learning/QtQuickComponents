// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    id: root

    property url imageUrl: ""
    required property string frameColor;

    signal catClicked(sound: string)

    onCatClicked: function(sound) {
        topText.count = topText.count + 1;
    }

    Rectangle {
        width: root.width
        height: root.height
        color: root.frameColor
        border.color: "black"

        Text {
            id: topText

            property int count: 0

            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr(`Clicked ${count} times`)
        }

        Image {
            anchors.fill: parent
            anchors.margins: 30
            source: root.imageUrl

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.catClicked("Meow")
                }
            }
        }
    }
}
