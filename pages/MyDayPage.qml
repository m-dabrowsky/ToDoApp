/****************************************************************************
**
**                       ---- MyDayPage.qml ----
**
**  Plik z zadaniami na dany dzień
**
**
****************************************************************************/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.15
import "../common"
import "../common/Buttons"
import "../menu"
import ToDo 1.0

Page {
    id: root


    background: Rectangle {
        color: backgroundColor // w zależności theme
    }

    ToDoModel{
        id: toDoModel
        list: toDoList
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.margins: 15

        ListView {
            id: listView        
            model: toDoModel
            Layout.fillHeight: true
            Layout.fillWidth: true

            delegate: ColumnLayout {
                width: listView.width
                height: 55
                /* ---- Background wiersza ---- */
                Rectangle {
                    id: backgroundRow
                    Layout.fillWidth: true
                    default property alias data: row.data
                    implicitWidth: row.implicitWidth
                    implicitHeight: 50
                    // zmiana w zależności od wybranego Theme
                    color: rowTaskColor
                    radius: 15

                    RowLayout {
                        id: row
                        anchors.fill: parent
                        spacing: 8

                            /* ---- Zaznaczenie taska ---- */
                            CheckBox{
                                id: control
                                checked: false
                                padding: 0
                                Layout.leftMargin: 8
                                onClicked: {
                                    model.done = checked
                                    if(checked) {
                                        taskName.font.strikeout = true
                                        sign.text = "\u2713"
                                        checkBoxBorder.color = "#62f065"
                                    }
                                    else if(!checked) {
                                        taskName.font.strikeout = false
                                        sign.text = ""
                                        checkBoxBorder.color = "#ffffff"
                                    }
                                }
                                indicator: Rectangle {
                                        id: checkBoxBorder
                                        implicitWidth: 26
                                        implicitHeight: 26

                                        x: control.leftPadding
                                        y: parent.height / 2 - height / 2
                                        radius: 8
                                        border.color: "#2cd12f"
                                        color: "#ffffff"
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        Text { // check
                                            id: sign
                                            visible: checked  &&  !radio
                                            anchors.centerIn: parent
                                            text: "" // CHECK MARK
                                            font.pixelSize: parent.height
                                        }
                                } // indicator Rectangle
                            } // control (CheckBox)

                            /* ---- Nazwa taska na liscie ---- */
                            TextField {
                                id: taskName
                                leftPadding: 13
                                anchors.left: control.right
                                Layout.fillWidth: true
                                // zmiana w zależności od wybranego Theme
                                color: primaryTextColor
                                text: model.description
                                background: Rectangle {
                                    implicitWidth: 280
                                    implicitHeight: 48
                                    color: "transparent"
                                    border.color: "transparent"
                                }
                            }
                            /* ---- Button usunięcia zadania z listy ---- */
                            RoundButton {
                                id: removingButton
                                implicitHeight: 36
                                implicitWidth: 36
                                anchors.left: taskName.right
                                onClicked: {
                                    toDoList.removeCompletedItem(model.index)
                                    //TODO:
                                    count--
                                }
                                contentItem: Item {
                                    implicitHeight: 24
                                    implicitWidth: 24
                                    Image {
                                        id: contentImage
                                        source: "qrc:/img/clear_black_24dp.svg"
                                        anchors.centerIn: parent
                                        anchors.fill: parent
                                    }
                                    ColorOverlay {
                                        anchors.fill: contentImage
                                        source: contentImage
                                        color: "#f14134"
                                    }
                                }
                                background:
                                    Rectangle {
                                    id: buttonBackground
                                    height: 26
                                    width: 26
                                    color: rowTaskColor
                                    radius: width / 2
                                    opacity: removingButton.pressed ? 0.75 : 1.0
                                }
                            } // RemovingButton
                    } // row (RowLayout)
                } // background (Rectangle)
            } // columnLayout
        } // listView

        /* ---- Background pola do wpisywania taska ---- */
        Rectangle {
            id: backgroundTextInput
            Layout.fillWidth: true
            default property alias data: rowLayout.data
            implicitWidth: rowLayout.implicitWidth
            implicitHeight: rowLayout.implicitHeight
            color: inputTaskColor
            radius: 30
            RowLayout {
                id: rowLayout
                anchors.fill: parent
                spacing: 15
                // pokazanie nad todoList view
                z: 1

                /* ---- Pole tekstowe ---- */
                TextField {
                    id: todoInputField
                    leftPadding: 16
                    anchors.left: parent.left
                    Layout.fillWidth: true
                    placeholderText: "New"
                    color: primaryTextColor
                    background: Rectangle{
                        implicitWidth: 280
                        implicitHeight: 48
                        color: "transparent"
                    }
                }
                /* ---- Przycisk dodawania taska do listy ---- */
                RoundButton {
                    id: addingButton
                    anchors.left: todoInputField.right
                    onClicked: {
                        toDoList.appendItem(todoInputField.text)
                        todoInputField.text = ''
                        // zliczanie dodanych tasków
                        count++

                    }

                    contentItem: Item {
                        implicitHeight: 24
                        implicitWidth: 24
                        Image {
                            id: addingImage
                            source: "qrc:/img/add_black_24dp.svg"
                            anchors.centerIn: parent
                            anchors.fill: parent
                        }
                        ColorOverlay {
                            anchors.fill: addingImage
                            source: addingImage
                            color: "#ffffff"
                        }
                    }
                    background:
                        Rectangle {
                        id: addingButtonBackground
                        height: 26
                        width: 26
                        color: accentColor
                        radius: width / 2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        opacity: addingButtonBackground.pressed ? 0.75 : 1.0
                        layer.enabled: addingButton.showShadow
                        layer.effect: DropShadow {
                            verticalOffset: 3
                            horizontalOffset: 1
                            color: "#333333"
                            samples: addingButtonBackground.pressed ? 20 : 10
                            spread: 0.5
                        }
                    }
                } // addingButton (roundButton)
            } // rowLayout
        } // backgroundTextInput
    } // columnLayout
} // root (Page)
