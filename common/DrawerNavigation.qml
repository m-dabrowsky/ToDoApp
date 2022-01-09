/****************************************************************************
**
**                       ---- DrawerNavigation.qml ----
**
**  Odpowiada za wyświetlenie paska Menu
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"

Drawer {
    id: myBar
    z: 1
    width: Math.min(240,  Math.min(appWindow.width, appWindow.height) / 3 * 2 )
    height: appWindow.height

    /* ---- Tło całego paska menu ---- */
    background: Rectangle {
        // zmiana tła w zależności od wybranego Theme
        color: backgroundColor

    }
    Flickable {
        contentHeight: myButtons.height
        anchors.fill: parent
        clip: true

        /* ---- Główna kolumna ---- */
        ColumnLayout {
            id: myButtons
            anchors.left: parent.left
            anchors.right: parent.right

            /* ---- Obiekt przechowujący obrazek, imię i adres email ---- */
            Item {
                id: userInfo
                anchors.left: parent.left
                anchors.right: parent.right
                height: 60
                Rectangle {
                    anchors.fill: parent
                    // zmiana w zależności od wybranego primaryColor
                    color: primaryColor
                }

                /* ---- Etykiety ---- */
                Item {
                    anchors.left: personItem.right
                    anchors.right: parent.right
                    height: 56
                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: 16
                        rightPadding: 16
                        Label {
                            text: "Michał Dąbrowski"
                            font.weight: Font.Medium
                            // zmiana w zależności od wybranego primaryColor
                            color: textOnPrimary
                        }
                        Label {
                            text: "michaldab@gmail.com"
                            // zmiana w zależności od wybranego primaryColor
                            color: textOnPrimary
                        }
                    }
                }
                Item {
                    // przestrzeń między contentem
                    height: 8
                }

                /* ---- Obrazek ---- */
                Item {
                    id: personItem
                    width: 48
                    height: 48
                    x: 16
                    y: 12
                    Image {
                        id: personImage
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/img/perm_identity_black_24dp.svg"
                    }
                    ColorOverlay {
                        anchors.fill: personImage
                        source: personImage
                        // zmiana w zależności od wybranego primaryColor
                        color: textOnPrimary
                    }
                }
            } // userInfo

            /* ---- Przestrzeń pomiędzy zawartością okna - google material guide ---- */
            Item {
                id: spaceContent
                height: 8
            }

            /*  ---- Kategorie, Ustawienia, About ----
             *  navigationModel ---> main.qml.
             *  Zawiera:
             *  {"type": "adres elementu", "name": "Nazwa elementu", "icon": "adres obrazka", "source": "cel po kliknięciu"}
             */
            Repeater {
                id: navigationButtonRepeater
                model: navigationModel

                Loader {
                    Layout.fillWidth: true
                    source: modelData.type
                    active: true
                }
            }
        } // myButtons (ColumnLayout)
    ScrollIndicator.vertical: ScrollIndicator { }
    } // Flickable
} // myBar (Drawer)

