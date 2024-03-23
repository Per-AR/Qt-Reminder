import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 300
    title: "Reminder App"
    color: "#2E4057"

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Label {
            text: "Eye Exercise Interval (minutes):"
            color: "white"
        }
        TextField {
            id: eyeExerciseInterval
            placeholderText: "Enter interval in minutes"
            Layout.fillWidth: true
            Layout.margins: 5
            font.pixelSize: 14
            font.family: "Arial"
            color: "white"
            background: Rectangle {
                color: "#34495E"
                radius: 10
            }
        }
        Label {
            text: "Move Around Interval (minutes):"
            color: "white"
        }
        TextField {
            id: moveAroundInterval
            placeholderText: "Enter interval in minutes"
            Layout.fillWidth: true
            Layout.margins: 5
            font.pixelSize: 14
            font.family: "Arial"
            color: "white"
            background: Rectangle {
                color: "#34495E"
                radius: 10
            }
        }
        Label {
            text: "Drink Water Interval (minutes):"
            color: "white"
        }
        TextField {
            id: drinkWaterInterval
            placeholderText: "Enter interval in minutes"
            Layout.fillWidth: true
            Layout.margins: 5
            font.pixelSize: 14
            font.family: "Arial"
            color: "white"
            background: Rectangle {
                color: "#34495E"
                radius: 10
            }
        }

        Button {
    text: "Set Intervals"
    background: Rectangle {
        color: "#4E6E98"
        radius: 10
    }
    Layout.fillWidth: true
    Layout.margins: 5
    font.pixelSize: 14
    font.family: "Arial"
    onClicked: {
        var eyeInterval = parseInt(eyeExerciseInterval.text)
        var moveInterval = parseInt(moveAroundInterval.text)
        var waterInterval = parseInt(drinkWaterInterval.text)
        backend.setEyeInterval(eyeInterval)
        backend.setMoveInterval(moveInterval)
        backend.setWaterInterval(waterInterval)
    }
}
    }
}
