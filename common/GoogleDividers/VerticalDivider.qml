/****************************************************************************
**
**                       ---- VerticalDivider.qml ----
**
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Item {
    implicitWidth: 8
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    Rectangle {
        id: theRectangle
        width: 1
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0.12
        color: "#000000"
    }
}
