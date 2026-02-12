// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt Quick Object Interaction")

    Column {
        anchors.centerIn: parent
        spacing: 20

        Row {
            spacing: 20

            // Mouse Interaction
            Rectangle {
                id: rectangle_topleft

                width: 150
                height: 150
                color: "red"

                Text {
                    anchors.centerIn: parent
                    width: parent.width - 30
                    color: "white"
                    text: qsTr("Click -> BLUE\nDouble Click -> RED")
                    wrapMode: Text.WordWrap
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        rectangle_topleft.color = "blue"
                    }
                    onDoubleClicked: {
                        rectangle_topleft.color = "red"
                    }
                }
            }

            Rectangle {
                width: 150
                height: 150
                color: "lightblue"
                border.width: 2

                Text {
                    id: status

                    anchors.centerIn: parent
                    text: qsTr("Hover over me")
                }

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    onEntered: {
                        status.text = qsTr("Cursor ENTERED")
                    }
                    onExited: {
                        status.text = qsTr("Cursor EXITED")
                    }
                }
            }

            // Keyboard Interaction
            Rectangle {
                id: circle

                width: 150
                height: 150
                radius: height
                color: focus ? "greenyellow" : "pink"
                focus: true

                KeyNavigation.down: rectangle_bottomLeft

                TextEdit {
                    anchors.centerIn: parent
                    width: parent.width - 20
                    text: qsTr("Click on the text to edit. It will shift focus from the circle")
                    wrapMode: Text.WordWrap

                    Keys.onEscapePressed: {
                        circle.focus = true
                    }
                }
            }
        }

        Row {
            spacing: 20

            // Keyboard and Touch Interaction
            Rectangle {
                id: rectangle_bottomLeft

                width: 150
                height: 150
                border.width: 2
                color: focus ? "greenyellow" : "yellow"

                KeyNavigation.up: circle

                Text {
                    anchors.centerIn: parent
                    text: qsTr("MultiPointTouchArea")
                }

                MultiPointTouchArea {
                    anchors.fill: parent
                    mouseEnabled: true

                    onPressed: function(points) {
                        console.log(qsTr(`Pressed point (${points[0].x}, ${points[0].y})`))
                    }
                }
            }

            // Tap and Hover Handler
            Rectangle {
                width: 150
                height: 150
                color: tapHandler.pressed ? "plum" : hoverHandler.hovered ? "orange" : "tan"

                Text {
                    anchors.centerIn: parent

                    text: qsTr("Tap and Hover Handler")
                }

                TapHandler {
                    id: tapHandler
                }

                HoverHandler {
                    id: hoverHandler
                }
            }
        }
    }
}
