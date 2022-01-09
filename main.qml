import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import "common"
import "pages"
import "tab"
import "menu"
import "common/GoogleDividers"
import "common/GoogleTypography"

ApplicationWindow {
    id: appWindow
    visible: true


    // ===========================================================
    //                  P R I M A R Y  COLORS
    // ===========================================================
    property variant primaryPalette: myApp.defaultPrimaryPalette()
    property color primaryLightColor: primaryPalette[0]
    property color primaryColor: primaryPalette[1]
    property color primaryDarkColor: primaryPalette[2]
    property color textOnPrimaryLight: primaryPalette[3]
    property color textOnPrimary: primaryPalette[4]
    property color textOnPrimaryDark: primaryPalette[5]
    Material.primary: primaryColor

    // ===========================================================
    //                  A C C E N T  COLORS
    // ===========================================================
    property variant accentPalette: myApp.defaultAccentPalette()
    property color accentColor: accentPalette[0]
    property color textOnAccent: accentPalette[1]

    // ===========================================================
    //                  T H E M E  COLORS
    // ===========================================================
    property variant themePalette: myApp.defaultThemePalette() // domyśle zwróci bluTheme
    property color dividerColor: themePalette[0]
    property color backgroundColor: themePalette[1]
    property color primaryTextColor: themePalette[2]
    property color secondaryTextColor: themePalette[3]
    property color inactiveIconColor: themePalette[4]
    property color markerColor: themePalette[5]
    property color rowTaskColor: themePalette[6]
    property color inputTaskColor: themePalette[7]
    property int isActivate: themePalette[8]




    // ===========================================================
    //                          MODEL
    // ===========================================================
    property var navigationModel: [
          // Subtitle
          {"type": "../menu/DrawerSubtitle.qml", "name": "Categories", "icon": "", "source": ""},
          // Categories
          {"type": "../menu/DrawerButton.qml", "name": "My Day", "icon": "today_black_24dp.svg", "source": "../pages/MyDayPage.qml", "showCounter":true, "index": 0},
          {"type": "../menu/DrawerButton.qml", "name": "Home Tasks", "icon": "home_black_24dp.svg", "source": "../pages/HomeTaskPage.qml", "showCounter":false},
          {"type": "../menu/DrawerButton.qml", "name": "Groceries", "icon": "local_grocery_store_black_24dp.svg", "source": "../pages/GroceriesPage.qml", "showCounter":false},
          {"type": "../menu/DrawerButton.qml", "name": "Work", "icon": "work_black_24dp.svg", "source": "../pages/WorkPage.qml", "showCounter":false},
          // Divider
          {"type": "../menu/DrawerDivider.qml", "name": "", "icon": "", "source": ""},
          // Settings and AboutInformation
          {"type": "../menu/DrawerButton.qml", "name": "Settings", "icon": "settings2x.png", "source": "../pages/SettingsPage.qml", "showCounter":false},
          {"type": "../menu/DrawerTextButton.qml", "name": "About App", "icon": "", "source": "../pages/AboutPage.qml", "showCounter":false, "index": 1}
    ]


    property var navigationData: [
        {},
        {"counter":1},
        {"counter":2},
        {"counter":3},
        {"counter":4},
        {},
        {},
        {},
    ]



    property int count: 0                                           // zliacznie tasków
    property int navigationIndex: -1                                //
    property bool highlightActiveNavigationButton : true            // domyślne włączenie podświetlenia About w bocznym pasku
    property bool hideTitleBar: false                               // domyślne wyłączenie ukrycia paska ToolBar


    /* ---- Załadowanie nagłówka i przypisanie go do header ---- */
    header: titleBar
    Loader {
        id: titleBar
        // wyświetlanie w zależności od pozycji switch'a w opcjach
        visible: !hideTitleBar
        source: "common/HeaderToolBar.qml"
    }

    /* ---- Załadowanie strony startowej ---- */
    StackView {
        id: stackView
        focus: true
        anchors.fill: parent
        initialItem: "qrc:/pages/MyDayPage.qml"
    }

    /* ---- Boczny pasek z menu ---- */
    DrawerNavigation {
        id: navigationBar
    }


    /*
     *  Funkcje wywoływane na stronach AccentColorPage i PrimaryColorPage:
     *  po kliknięciu na element z ListView przekazywany jest indeks, dzięki któremu do primaryPalette
     *  przypisuje się odpowiadający indeksowi kolor w pliku C++
     */
    function switchPrimaryPalette(paletteIndex) {
        primaryPalette = myApp.primaryPalette(paletteIndex)
    }
    function switchAccentPalette(paletteIndex) {
        accentPalette = myApp.accentPalette(paletteIndex)
    }

}


