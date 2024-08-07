import QtQuick
import QtQuick.Layouts

Item {
    property string myString: "abcdefghijklmnopqrstuvwxyz0123456789"
    //property string myString: "abc123"

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Rectangle {
            id: container

            border.width: 1
            height: (parent.height-3*parent.spacing) / 4
            width: parent.width

            Item {
                id: spare
                height: parent.height
                width: myText.contentWidth
            }

            Text {
                Rectangle {
                    color: "pink"
                    opacity: 0.5
                    anchors.fill: parent
                }

                id: myText
                height: parent.height
                width: container.width - 2*10 - red.width - green.width - blue.width
                font.pixelSize: height/3
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                text: myString
            }

            Rectangle {
                id: red
                color: "transparent"
                border.width: 2; border.color: "red"
                height: parent.height
                width: 30
                anchors.left: myText.contentWidth > myText.width ? undefined : spare.right
                anchors.leftMargin: myText.contentWidth > myText.width ? 0 : 10
                anchors.right: myText.contentWidth > myText.width ? blue.left : undefined
                anchors.rightMargin: myText.contentWidth > myText.width ? 10 : 0
            }

            Rectangle {
                id: blue
                color: "blue"
                height: parent.height
                width: 60
                anchors.right: green.left
                anchors.rightMargin: 10
            }

            Rectangle {
                id: green
                color: "green"
                height: parent.height
                width: 90
                anchors.right: parent.right
            }
        }

        Rectangle {
            border.width: 1
            height: (parent.height-3*parent.spacing) / 4
            width: parent.width

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Text {
                    id: myText2
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pixelSize: height/3
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    text: myString
                }

                Item {
                    id: spare2
                    Layout.fillHeight: true
                    Layout.fillWidth: myText2.contentWidth < myText2.width
                    Layout.preferredWidth: myText2.contentWidth > myText2.width ? 0 : 50
                }

                Rectangle {
                    id: red2
                    color: "red"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 30
                }

                Item {
                    id: spare3
                    Layout.fillHeight: true
                    Layout.fillWidth: myText2.contentWidth >= myText2.width
                    Layout.preferredWidth: myText2.contentWidth <= myText2.width ? 0 : 50
                }

                Rectangle {
                    id: blue2
                    color: "blue"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 60
                }

                Rectangle {
                    id: green2
                    color: "green"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 90
                }
            }
        }

        Rectangle {
            id: container3
            border.width: 1
            height: (parent.height-3*parent.spacing) / 4
            width: parent.width

            RowLayout {
                anchors.fill: parent
                spacing: 10

                property int availableForText: container3.width - red3.width - green3.width - blue3.width - 3*spacing

                Text {
                    id: myText3
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth > parent.availableForText  ? parent.availableForText : contentWidth
                    font.pixelSize: height/3
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    text: myString
                }

                Rectangle {
                    id: red3
                    color: "red"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 30
                    Layout.leftMargin: 10
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: myText3.contentWidth > parent.availableForText ? 0 : -1
                    Layout.fillWidth: myText3.contentWidth <= parent.availableForText
                }

                Rectangle {
                    id: blue3
                    color: "blue"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 60
                }

                Rectangle {
                    id: green3
                    color: "green"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 90
                }
            }
        }

        Rectangle {
            id: container4
            border.width: 1
            height: (parent.height-3*parent.spacing) / 4
            width: parent.width

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width - fix.implicitWidth

                    Text {
                        id: myText4
                        height: parent.height
                        font.pixelSize: height/3
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        text: myString
                    }

                    Rectangle {
                        id: red4
                        color: "red"
                        height: parent.height
                        width: 30
                        anchors.left: myText4.right
                        anchors.leftMargin: 10
                    }
                }

                RowLayout {
                    id: fix
                    spacing: 10

                    Rectangle {
                        id: blue4
                        color: "blue"
                        Layout.fillHeight: true
                        Layout.preferredWidth: 60
                    }

                    Rectangle {
                        id: green4
                        color: "green"
                        Layout.fillHeight: true
                        Layout.preferredWidth: 90
                    }
                }
            }
        }
    }
}
