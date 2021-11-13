import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQml.Models 2.12
Item {
    id: element

    // property that hold json data
    property var txt: ""
    property int cart_width: 200

    MySearchBar {
        id: searchBar
    }

    GridView{
        id: grid
        anchors.top: searchBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 10
        width: parent.width
        height: parent.height - 40
        cellWidth: cart_width + (width - Math.floor(width/cart_width) * cart_width)/(Math.floor(width/cart_width))
        cellHeight: 300
        // width - width/cellwidth * cellwidth\

        anchors.leftMargin: 10
        anchors.rightMargin: 10
        z : 0
        flow: GridView.LeftToRight

        ScrollBar.vertical: ScrollBar {
            visible: true    // hides scrollbar
        }

        clip: true

        model: ListModel{
            id:model
            dynamicRoles: true
        }

        delegate:Rectangle{
            width: grid.cellWidth
            height: grid.cellHeight
            color: "#0A222E"
            Cart{
                pod_image: model.pod_image
                pod_name: model.pod_name
                pod_address: model.pod_address
                anchors.centerIn:parent
                anchors.margins: 5
            }
        }
    }

    Component.onCompleted: requestActivate()

}

