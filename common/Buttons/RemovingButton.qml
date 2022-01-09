import QtQuick 2.0
import QtGraphicalEffects 1.0

/* ---- Usuniecie taska ---- */
Image {
    id: removeImage
    width: 50
    height: 50
    source: "qrc:/img/remove_circle_black_24dp.svg"
    fillMode: Image.PreserveAspectFit

    ColorOverlay {
        anchors.fill: removeImage
        source: removeImage
        color: "#333"
    }

} // removeTaskButton (Image)
