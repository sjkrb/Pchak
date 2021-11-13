import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.Controls 2.5


Window {
    id: mainview
    objectName : "root"
    visible: true
    width: 640
    height: 480
    minimumWidth: 300
    minimumHeight: 500
    title: qsTr("Pchak")
    flags: Qt.Window | Qt.FramelessWindowHint

    x: (Screen.width - width)/2
    y: (Screen.height - height)/2


    // for stackview pushing
    signal pusher(var a ,var args);
    onPusher: {
        stack.push(a,args)
        console.log(args)
    }


    Topbar
    {
        id : topRect
        anchors.top: mainview.top
    }

    // menu bar
    MyMenu
    {
        id : mymenu
        objectName: "menu"
        width: 50
        height: parent.height -20
        anchors.top: topRect.bottom
    }

    //main Page
    Rectangle
    {
        id:baseRect
        anchors.top: topRect.bottom
        anchors.left: mymenu.right
        width: parent.width - 50
        height: parent.height - 20
        color: "#0A222E"
        
        StackView{

            id: stack

            anchors.fill: baseRect
            initialItem: "qrc:/MainView.qml"

            pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }

            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }

            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }

            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }
        }
    }


    MouseArea{
        id : resizearea
        width: 5
        height: 5
        anchors.bottom: parent.bottom
        anchors.right: parent.right


        cursorShape: Qt.SizeAllCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainview.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
        }

    }


    Component.onCompleted: requestActivate()

}
