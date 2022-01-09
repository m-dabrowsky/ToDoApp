/****************************************************************************
**
**                       ---- DrawerTextButton.qml ----
**
**  Odpowiada za wyświetlenie About App
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"
import "../pages"

ItemDelegate {
    id: myButton

    property int isActive: index == navigationIndex
    property int counter: navigationData[index].counter
    height: 48
    width: myBar.width

    /* ---- Podświetlenie przycisku ---- */
    Rectangle {
        // jeśli zaznaczone opcje w SettingsPage (domyśle highlightActiveNavigationButton == true)
        visible: highlightActiveNavigationButton
        height: myButton.height
        width: myButton.width
        color: Material.listHighlightColor
    }

    /* ---- Nazwa ---- */
    Row {
        leftPadding: 16
        rightPadding: 16
        anchors.verticalCenter: parent.verticalCenter
        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: modelData.name
            opacity: 0.87
            // zmiana w zależności od wybranego Theme
            color: isActive? primaryTextColor : secondaryTextColor
            font.pixelSize: 14
            font.weight: Font.Medium
        }
    } // row

    /* ---- Marker z prawej strony ---- */
    Rectangle {
        visible: modelData.showMarker
        anchors.right: parent.right
        width: 6
        height: parent.height
        // zmiana w zależności od wybranego Theme
        color: markerColor
    }

    onClicked: {
        navigationIndex = index
        stackView.push( navigationModel[navigationIndex].source )
        navigationBar.close()
    }
} // myButton
