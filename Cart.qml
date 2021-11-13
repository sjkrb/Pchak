import QtQuick 2.12
import QtQuick.Controls 2.0


Rectangle{

    property url    pod_image:  ""
    property string pod_name:   ""
    property string pod_address: ""
    property string pod_discription: ""
    id :cart

    width: cart_width
    height: 280
    color: "#0E3045"
    //            color: GridView.isCurrentItem ? "black" : "#0E3045"
    radius: 5

    ToolTip.text: pod_discription

    Column{
        RoundedImage {
            id: img
            width: 200
            height: 200
            source: pod_image
            fillMode: Image.PreserveAspectFit
            m_radius: 5
        }

        Text {
            id: txt

            text: pod_name
            width: parent.width
            wrapMode: Text.Wrap
            font.family: "qrc:/fonts/NexaLight.otf"
            color: "white"
            maximumLineCount: 3
            elide: Text.ElideRight
            padding:10
        }

        Text {
            id: discription
            text: pod_discription
            width: parent.width
            wrapMode: Text.Wrap
            font.family: "qrc:/fonts/NexaLight.otf"
            color: "#ffffffaa"
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            mainview.pusher("qrc:/PodcastPage.qml",{"address":pod_address,"image":pod_image,"name":pod_name,"discription":pod_discription})
        }
    }


}



