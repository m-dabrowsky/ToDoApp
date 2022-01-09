import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    height: addImage.implicitHeight
    width: addImage.implicitWidth
    Image {
        id: addImage
        source: "qrc:/img/add_circle_black_24dp.svg"
    }
}
