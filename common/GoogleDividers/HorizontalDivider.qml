/****************************************************************************
**
**                       ---- HorizontalDivider.qml ----
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Item {
    height: 8
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.margins: 6
    Rectangle {
        width: parent.width
        height: 1
        opacity: 0.12
        color: "#FFFFFF"
    }
}
