import QtQuick

Window {
    width: 600
    height: 800
    visible: true
    title: qsTr("A multi-pages demo to play around with Layouts")

    Column {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Row {
            id: header
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 10
            }
            height: 50
            spacing: 10

            Tab {
                height: parent.height
                selected: loader.source == "Page1.qml"
                text: "page 1"
                onClicked: loader.source = "Page1.qml"
            }

            Tab {
                height: parent.height
                selected: loader.source == "Page2.qml"
                text: "page 2"
                onClicked: loader.source = "Page2.qml"
            }
        }

        Item {
            width: parent.width
            height: parent.height - header.height

            Loader {
                id: loader
                anchors {
                    fill: parent
                    margins: 10
                }
                source: "Page1.qml"
            }
        }
    }

    component Tab : Rectangle {
        id: root

        property bool selected
        property alias text: pageTitle.text

        signal clicked

        width: page.implicitWidth
        border.width: selected ? 3 : 1

        Item {
            id: page
            height: parent.height
            implicitWidth: pageTitle.implicitWidth + 10

            Text {
                id: pageTitle
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }


}
