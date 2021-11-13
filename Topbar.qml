import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle{
    width: parent.width
    height: 20
    color: "#0E3045"
    z : 100

    MouseArea {
        anchors.fill: parent
        property point lastMousePos: Qt.point(0, 0)
        onPressed: { lastMousePos = Qt.point(mouseX, mouseY); }
        onMouseXChanged: mainview.x += (mouseX - lastMousePos.x)
        onMouseYChanged: mainview.y += (mouseY - lastMousePos.y)
    }

    Text {
        id: appname
        font.family: "qrc:/fonts/NexaBlackItalic.otf"
        font.bold: true
        color: "white"
        text: "Pichak"
        anchors.centerIn: parent
    }

    Button{
        id:btn_closeAll
        height: parent.height
        width: 20
        icon.source: "qrc:/icons/close_big"
        icon.height: 20
        icon.width: 20
        icon.color: btn_closeAll.hovered ? "#DAE1E9" : "#dc5a6c"

        background: Rectangle{
            color: btn_closeAll.hovered ? "#dc5a6c" : "#0E3045"
        }

        padding: 0
        anchors.right: parent.right

        onClicked:
        {
            Database.save()
            Qt.quit()
        }

    }

    Button{
        id: btn_minimizeAll
        height: parent.height
        width: 20
        icon.source: "qrc:/icons/minimize"
        icon.height: 20
        icon.width: 20
        icon.color: "white"

        background: Rectangle{
            color: "#0E3045"
        }

        padding: 0
        anchors.rightMargin: 5
        anchors.right: btn_closeAll.left

        onClicked: {
            console.log("minimize")
            mainview.showMinimized()
        }
    }

}
