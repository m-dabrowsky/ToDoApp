/****************************************************************************
**
**                       ---- DrawerDivider.qml ----
**
**  Kreska oddzielająca zawartość Drawer'a
**  Zrobiona na podstawie:
**  https://www.google.com/design/spec/components/dividers.html#dividers-types-of-dividers
**  https://material.io/archive/guidelines/components/dividers.html#
**  8 pod i nad Divaderem --> 8+8 + 1 (grubość) = 17 (height)
****************************************************************************/
import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Item {
    height: 17
    anchors.left: parent.left
    anchors.right: parent.right
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 1
        // zmiana w zależności od wybranego Theme
        color: dividerColor
    }
}
