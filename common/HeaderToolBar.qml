/****************************************************************************
**
**                       ---- MyDayPage.qml ----
**
**  Nagłówek pojawiający się na każdej stronie z taskami
**  Ikona menu:
**  https://material.io/design/iconography/system-icons.html#system-icon-metrics
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../menu"

ToolBar {
    id: toolBar
    height: base.height
    RowLayout{
        anchors.fill: parent
        /* ---- Zmiana koloru tła ---- */
        Rectangle {
            id: background
            // zmiana w zależności od wybranego primaryColor
            color: primaryColor
            anchors.fill: parent

            /* ---- Przycisk MENU ---- */
            Rectangle {
                id: base
                // zmiana w zależności od wybranego primaryColor
                color: primaryColor
                width: 48
                height: 48
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    id: menuButton
                    width: 24
                    height: 24
                    source: "qrc:/img/menu_black_24dp.svg"
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                             // Boczny pasek menu -> main.qml
                             navigationBar.open()
                        }
                    }
                    ColorOverlay {
                        anchors.fill: menuButton
                        source: menuButton
                        // zmiana w zależności od wybranego primaryColor
                        color: textOnPrimary
                    }
                }
            }

            /* ---- Nazwa Strony ---- */
            Label {
                id: pageTitle
                // zmiana w zależności od wybranego primaryColor
                color: textOnPrimary
                text: (navigationIndex == -1) ? "My Day" : navigationModel[navigationIndex].name
                font.pixelSize: 20
                anchors.centerIn: parent
            }
        } // background (Rectangle)
    } // RowLayout
} // ToolBar (nagłówek)

