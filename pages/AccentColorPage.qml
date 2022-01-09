import QtQuick 2.0
import QtQml.Models 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../common/GoogleTypography"

Page {
    id: accentPage
    property string name: "AccentColorPage"
    bottomPadding: 24
    topPadding: 16
    background: Rectangle {
        // zmiana w zależności od wybranego Theme
        color: backgroundColor
    }
    LabelHeadline {
        id: headline
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        leftPadding: 16
        rightPadding: 16
        bottomPadding: 16
        text: qsTr("Select Material Accent Color")
        // zmiana w zależności od wybranego Theme
        color: primaryTextColor
    }

    ListView {
        id: listView
        clip: true
        currentIndex: -1
        anchors.top: headline.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left

        delegate: Item {
            id: itemDelegate
            width: parent.width
            implicitHeight: 40
            Row {
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: 32
                    implicitWidth: 48
                    color: primaryColor
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: 32
                    implicitWidth: 32
                    color: model.bg
                }
                LabelBody {
                    leftPadding: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.title
                    color: primaryTextColor
                }
            } // Row
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    appWindow.switchAccentPalette(index)
                }
            } // mouse
        } // delegateItem

        model: ListModel {
            ListElement { title: qsTr("Material Basic"); bg: "#31315B"; border: "#FFFFFF"}
            ListElement { title: qsTr("Material Red"); bg: "#F44336"; border: "transparent" }
            ListElement { title: qsTr("Material Pink"); bg: "#E91E63"; border: "transparent" }
            ListElement { title: qsTr("Material Purple"); bg: "#9C27B0"; border: "transparent" }
            ListElement { title: qsTr("Material DeepPurple"); bg: "#673AB7"; border: "transparent" }
            ListElement { title: qsTr("Material Indigo"); bg: "#3F51B5"; border: "transparent" }
            ListElement { title: qsTr("Material Blue"); bg: "#2196F3"; border: "transparent" }
            ListElement { title: qsTr("Material LightBlue"); bg: "#03A9F4"; border: "transparent" }
            ListElement { title: qsTr("Material Cyan"); bg: "#00BCD4"; border: "transparent" }
            ListElement { title: qsTr("Material Teal"); bg: "#009688"; border: "transparent" }
            ListElement { title: qsTr("Material Green"); bg: "#4CAF50"; border: "transparent" }
            ListElement { title: qsTr("Material LightGreen"); bg: "#8BC34A"; border: "transparent" }
            ListElement { title: qsTr("Material Lime"); bg: "#CDDC39"; border: "transparent" }
            ListElement { title: qsTr("Material Yellow"); bg: "#FFEB3B"; border: "transparent" }
            ListElement { title: qsTr("Material Amber"); bg: "#FFC107"; border: "transparent" }
            ListElement { title: qsTr("Material Orange"); bg: "#FF9800"; border: "transparent" }
            ListElement { title: qsTr("Material DeepOrange"); bg: "#FF5722"; border: "transparent" }
            ListElement { title: qsTr("Material Brown"); bg: "#795548"; border: "transparent" }
            ListElement { title: qsTr("Material Grey"); bg: "#9E9E9E"; border: "transparent" }
            ListElement { title: qsTr("Material BlueGrey"); bg: "#607D8B"; border: "transparent" }
        }
        ScrollIndicator.vertical: ScrollIndicator { }
    } // listView
} // accentPage
