/****************************************************************************
**
**                       ---- SettingPage.qml ----
**
**  Strona z ustawieniami
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../common/GoogleDividers"
import "../common/GoogleTypography"

Flickable {
    property string name: "SettingsPage"
    anchors.fill: parent
    clip: true

    Pane {
        id: root
        anchors.fill: parent
        hoverEnabled: true
        padding: 24
        background: Rectangle {
            color: backgroundColor
        }

        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left

            RowLayout {
                Label {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    color: primaryTextColor                 // w zależności od theme
                    text: qsTr("Settings is a Page where you can change some things.\nFor example hightlight Switch can turn off Highlight of About button in Drawer and Hide title bar just make title bar unvisible")
                }
            }

            HorizontalDivider {}

            /* ---- Switch od wyłącznia/włączenia podświetlenie przycisku About ---- */
            RowLayout {

                Switch {
                    id: highLightSwitch
                    text: "Highlight Switch"
                    focusPolicy: Qt.NoFocus
                    topPadding: 6
                    leftPadding: 12
                    contentItem: Text {
                        text: highLightSwitch.text
                        font: highLightSwitch.font
                        opacity: enabled ? 1.0 : 0.3
                        color: highLightSwitch.down ? "#17a81a" : "#21be2b"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: highLightSwitch.indicator.width + highLightSwitch.spacing

                    }
                    checked: highlightActiveNavigationButton
                    onCheckedChanged: {
                        highlightActiveNavigationButton = checked
                    }
                } // switch highlightActiveNavigationButton
            } // row highlightActiveNavigationButton

            /* ---- Switch od ukrycia paska ToolBar ---- */
            RowLayout {
                Switch {
                    id: hideTitleBarSwitch
                    text: "Hide TitleBar"
                    focusPolicy: Qt.NoFocus
                    leftPadding: 12
                    contentItem: Text {
                        text: hideTitleBarSwitch.text
                        font: hideTitleBarSwitch.font
                        opacity: enabled ? 1.0 : 0.3
                        color: hideTitleBarSwitch.down ? "#17a81a" : "#21be2b"
                        verticalAlignment: Text.AlignVCenter
                        leftPadding: hideTitleBarSwitch.indicator.width + hideTitleBarSwitch.spacing
                    }
                    checked: hideTitleBar
                    onCheckedChanged: {
                        hideTitleBar = checked
                    }
                } // switch hideTitleBar
            } // row hideTitleBar

            /* ---- Button od zmiany kolorów w aplikacji ---- */
            RowLayout {
                Button{
                    id: changeColorbutton
                    text: "Change Colors"
                    enabled: true
                    contentItem: Text {
                        text: changeColorbutton.text
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "#FFFFFF"
                    }
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        border.color: changeColorbutton.down ? "#17a81a" : "#21be2b"
                        border.width: 2
                        radius: 8
                        color: "transparent"
                        }
                    onClicked: {
                        stackView.push("qrc:/pages/ColorSchemePage.qml")
                    }
                }
            }

        } // theContent (ColumnLayout)
    } // root (Pane)
    ScrollIndicator.vertical: ScrollIndicator { }
} // Flickable

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
