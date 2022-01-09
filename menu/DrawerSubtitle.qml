/****************************************************************************
**
**                       ---- DrawerSubtitle.qml ----
**
**  Odpowiada za wyświetlenie "Category" w bocznym pasku
**
**
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    height: 24
    Label {
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: 16
        font.weight: Font.Medium
        font.pixelSize: 14
        opacity: myBar.inactiveOpacity
        text: modelData.name
        color: secondaryTextColor
    }
}


