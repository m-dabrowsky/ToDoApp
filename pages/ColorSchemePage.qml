/****************************************************************************
**
**                       ---- ColorSchemePage.qml ----
**
**  Strona umożliwiająca zmianę PrimaryColor, AccentColor lub Theme Color
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../tab"


// Uzycie Page żeby jako nagłówek (header) zastosować zakładki
Page {
    id: colorPage
    property int myIndex: index
    property string name: "colorSchemePage"
    property alias currentIndex: swipeView.currentIndex

    header: tabBar

    /* ---- Załadowanie utworzeonego w oddzielnym pliku TabBar (gdyby nie oddzielny plik LOADER nie byłby potrzebny) ---- */
    Loader {
        id: tabBar
        source: "../tab/TextTabBar.qml"
        asynchronous: false
        active: true
        onLoaded: {
            if(item) {
                item.currentIndex = swipeView.currentIndex
            }
        }
    }

    /* ---- W celu zmiany stron przez przesunięcie myszką ---- */
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        onCurrentIndexChanged: {
            tabBar.item.currentIndex = currentIndex
        }

        Loader {
            // index 0
            id: pageOneLoader
            active: true
            source: "PrimaryColorPage.qml"
        }
        Loader {
            // index 1
            id: pageTwoLoader
            active: true
            source: "AccentColorPage.qml"
        }
        Loader {
            // index 2
            id: pageThreeLoader
            active: true
            source: "ThemePage.qml"
        }

    } // swipeView
} // colorPage
