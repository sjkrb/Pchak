import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: name
    property int cart_width: 200

    GridView
    {
        id : mainviewgrid
        anchors.fill: parent

        cellWidth: cart_width + (width - Math.floor(width/cart_width) * cart_width)/(Math.floor(width/cart_width))
        cellHeight: 300

        anchors.margins: 10
        flow: GridView.LeftToRight

        ScrollBar.vertical: ScrollBar {
            visible: true    // hides scrollbar
        }

        clip: true

        JSONListModel {
            id : podmodel
            source : "qrc:/database.json"
            query: "$.podcasts[*]"
        }


        model: podmodel.model
        delegate: Rectangle{
            width: mainviewgrid.cellWidth
            height: mainviewgrid.cellHeight
            color: "#0A222E"
            Cart{
                pod_image: model.image
                pod_name: model.name
                pod_address: model.address
                anchors.centerIn:parent
                anchors.margins: 5
            }
        }
    }
}
