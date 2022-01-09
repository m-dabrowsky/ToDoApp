/****************************************************************************
**
**                       ---- AboutPage.qml ----
**
**  Plik z informacjami o aplikacji
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../common/GoogleTypography"
import "../common/GoogleDividers"

Flickable {
    id: flickable
    anchors.fill: parent
    property string name: "About"

    Pane {
        id: root
        anchors.fill: parent
        background: Rectangle {
            // zmiana w zależności od wybranego Theme
            color: backgroundColor
        }
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left

            RowLayout {
                Label {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    text: qsTr("This app was made to learn QML and what is more important to learn about C++ Models and Drawer.\n\n")
                    // zmiana w zależności od wybranego primaryColor
                    color: textOnPrimary
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Label {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    bottomPadding: 0
                    text: qsTr("ToDo App v 1.0")
                    color: textOnPrimary
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Label {
                    topPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    bottomPadding: 0
                    text: qsTr("Created by Michael Dabrowsky")
                    color: textOnPrimary
                }
            }


            LabelHeadline {
                leftPadding: 10
                text: "ChangeLogs"
                // zmiana w zależności od wybranego Theme
                color: primaryTextColor
            }
            HorizontalDivider {}
            LabelSubheading {
                topPadding: 6
                leftPadding: 10
                rightPadding: 10
                font.bold: true
                Layout.fillWidth: true
                text: qsTr("Version 1.0")
                color: primaryTextColor
            }
            LabelBody {
                topPadding: 6
                leftPadding: 10
                rightPadding: 10
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                text: qsTr("• Dodano Drawer który umożliwia szybszy dostęp do menu i kategorii\r\n• Dodano możliwość wyboru koloru\n")
                color: primaryTextColor
            }
        } // ColumnLayout
    } // root (Pane)
    ScrollIndicator.vertical: ScrollIndicator { }
} // Flickable


