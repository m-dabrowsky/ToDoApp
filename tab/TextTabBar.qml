/****************************************************************************
**
**                       ---- TextTabBar.qml ----
**
**  Ten plik odpowiada za stworzenie widoku z zakładkami
**  Powstał w oparciu o Help -> TabBar -> Flicable Tabs
**      * index  - przechowuje indeks każdego przycisku na karcie TabBar
****************************************************************************/

import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"

TabBar {
    id: myTabBar
    Layout.fillWidth: true
    currentIndex: 0                                  // Przechowuje aktualny indeks (0 - zakładka PRIMARY, 1 -  zakładka ACCENT, 2 -  zakładka THEME)
    onCurrentIndexChanged: {                         // W momencie zmiany karty (przejście np: z 0 -> 1 )
        colorPage.currentIndex = currentIndex        // zmienia sie także index SwipeView w pliku ColorSchemePage
    }

    Repeater {
        model: ["PRIMARY", "ACCENT", "THEME"]

        TabButton {
            id: tabButton
            width: Math.max(100, myTabBar.width / 3) // 3 jest liczbą elementów w modelu
            focusPolicy: Qt.ClickFocus
            background: Rectangle {
                // zmiana w zależności od wybranego Theme
                color: backgroundColor
                opacity: tabButton.pressed ? 0.75 : 1.0

                /* ---- Podkreślenie aktualnej zakładki ---- */
                Rectangle {
                    id: line
                    width: parent.width
                    height: 2
                    anchors.bottom: parent.bottom
                    border.color: tabButton.activeFocus ? accentColor : "transparent"
                    color:  "transparent"
                }
            }
            /* ---- Nazwa ---- */
            text: modelData
            contentItem: Text {
                id: text
                topPadding: 6
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.AllUppercase
                text: tabButton.text
                // zmiana w zależności od wybranego accentColor
                color: accentColor
            }
        } // tabButton
    } // Repeater
} // myTabBar (TabBar)

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
