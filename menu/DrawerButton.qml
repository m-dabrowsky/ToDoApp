/****************************************************************************
**
**                       ---- DrawerButton.qml ----
**
**  Odpowiada za wyświetlenie poszczególnych kategori:
**  Main Menu, Home Taskas, Groceries, Work, Settings
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"

ItemDelegate {
    id: myButton

    // na poczatku navigationIndex = -1  więć żaden przycisk nie został kliknięty
    property int active: index == navigationIndex
    // Właściwosc do wyświetlenia liczby zadan
    property int counter: navigationData[index].counter
    height: 48
    width: myBar.width


    /* ---- Wiersz w którym jest ikona, kategoria, liczba tasków ---- */
    Row {
        id: row
        leftPadding: 16
        rightPadding: modelData.showCounter? 24 :  16
        anchors.verticalCenter: parent.verticalCenter

        /* ---- Ikona reprezentujaca daną kategorię ---- */
        Item {
            anchors.verticalCenter: parent.verticalCenter
            width: 24 + 15  // 15 jest tylko w celu zrobienia przestrzeni między elementami
            height: 24

            Image {
                id: myImage
                width: 24
                height: 24
                horizontalAlignment: Image.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/" + modelData.icon
            }
            ColorOverlay {
                id: colorOverlay
                anchors.fill: myImage
                source: myImage
                // zmiana w zależności od wybranego Theme
                color: inactiveIconColor
            }
        } // Ikona

        /* ---- Nazwa Kategorii ---- */
        Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: myImage.right
            text: modelData.name
            color: secondaryTextColor
            font.pixelSize: 14
            font.weight: Font.Medium
        }
    } // row

    /* ---- Liczba zadań w danej kategorii ---- */
    Label {
        rightPadding: 16
        visible: modelData.showCounter
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        text: counter
        // zmiana w zależności od wybranego Theme
        color: secondaryTextColor
        font.pixelSize: 14
        font.weight: Font.Medium
    } // label


    onClicked: {
        // kliknięcie na dany element powoduje przypisanie do navigationIndex odpowiedniu numeru odpowiadjacemu aktualnemu elementowi
        navigationIndex = index
        // wypchnięcie elmentu znajdujacego się modelu pod danym indeksem - > URL do strony umieszczono w source
        stackView.push(navigationModel[navigationIndex].source)
        // Kliknięcie powoduje zamknięcie DrawerNavigation.qml
        navigationBar.close()
    }
} // myButton
