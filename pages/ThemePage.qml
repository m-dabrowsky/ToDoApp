/****************************************************************************
**
**                       ---- SettingPage.qml ----
**
**  Strona umożliwiająca wybór Theme
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../common/GoogleTypography"
import "../common/GoogleDividers"


Flickable {
    id: flickable
    anchors.fill: parent
    property string name: "ThemePage"

    Pane {
        id: root
        anchors.fill: parent
        background: Rectangle {
            anchors.fill:parent
            Layout.fillHeight: true
            color: backgroundColor
        }

        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            /* ---- Tytuł ---- */
            LabelHeadline {
                leftPadding: 10
                bottomPadding: 24
                text: qsTr("Select your Theme")
                color: primaryTextColor
            }

            Column {
                id: column
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                /* ---- Blue Theme ---- */
                CheckBox {
                    id: blueTheme
                    text: "Blue Theme"
                    leftPadding: 6
                    contentItem: Text {
                        id: text1
                        text: blueTheme.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 40
                        font: blueTheme.font
                        color: primaryTextColor
                    }
                    checked: true
                    onCheckedChanged:  {
                        if(checked){
                            blackTheme.enabled = false
                            lightTheme.enabled = false
                            themePalette = myApp.swapThemePalette("Blue Theme")
                        } else {
                            blackTheme.enabled = true
                            lightTheme.enabled = true
                        }
                    }
                } // bluTheme checkBox

                /* ---- Black Theme ---- */
                CheckBox {
                    id: blackTheme
                    text: "Dark Theme"
                    contentItem: Text {
                        id: text2
                        text: blackTheme.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 40
                        font: blackTheme.font
                        color: primaryTextColor
                    }
                    checked: false
                    enabled: false
                    onCheckedChanged:  {
                        if(checked){
                            blueTheme.checked = false
                            //lightTheme.checked = false
                            blueTheme.enabled = false
                            lightTheme.enabled = false
                            themePalette = myApp.swapThemePalette("Dark Theme")
                        } else {
                            blueTheme.enabled = true
                            lightTheme.enabled = true
                        }

                    }
                }

                /* ---- Light Theme ---- */
                CheckBox {
                    id: lightTheme
                    text: "Light Theme"
                    contentItem: Text {
                        id: text3
                        text: lightTheme.text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 40
                        font: lightTheme.font
                        color: primaryTextColor
                    }
                    checked: false
                    enabled: false
                    onCheckedChanged:  {
                        if(checked){
                            blueTheme.checked = false
                            blueTheme.enabled = false
                            blackTheme.enabled = false
                            themePalette = myApp.swapThemePalette("Light Theme")
                        } else {
                            blueTheme.enabled = true
                            blackTheme.enabled = true
                        }
                    }
                }
            }
        } // ColumnLayout
    } // root (Pane)
    ScrollIndicator.vertical: ScrollIndicator { }
} // Flickable

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:480;width:640}
}
##^##*/
