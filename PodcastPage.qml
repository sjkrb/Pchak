import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0

Item {
    id : podcastpage
    property string address: ""
    property url image: ""
    property string name: ""


    XmlListModel{
        id: modelxml

        property bool loaded: false
        source: address
        namespaceDeclarations: "declare namespace media='http://search.yahoo.com/mrss/';
                                           declare namespace itunes='http://www.itunes.com/dtds/podcast-1.0.dtd';"
        query: "/rss/channel/item"

        XmlRole {name : "model_title"; query: "title/string()";}
        //        XmlRole {name : "model_audio"; query : "for $b in media:content where($b/@type/string()='audio/mpeg') return $b/@url/string()";}
        //        XmlRole {name : "model_image"; query : "for $b in media:content where($b/@type/string()='image/jpeg') return $b/@url/string()";}
        XmlRole {name : "model_audio"; query: "enclosure/@url/string()"}
        XmlRole {name : "model_image"; query : "itunes:image/@href/string()";}

        onStatusChanged: {
            if(status === XmlListModel.Ready)
            {
                loaded = true
            }
        }

    }


    Column{
        id: desc
        y: 20
        x: 20

        spacing: 20
        anchors.left: parent.left
        anchors.leftMargin: 20


        RoundedImage{
            width: 200
            height: 200
            m_radius: 5
            source: image
        }

        RoundButton
        {
            id:btn_sub

            anchors.horizontalCenter: parent.horizontalCenter
            checkable: true
            text : btn_sub.checked ? "UnSubscribe" : "Subscribe"
            font.family: ":/fonts/Nexa Bold.otf"
            checked: Database.isSubscribed(name)
            contentItem: Text {
                text: btn_sub.text
                color: btn_sub.checked ? "#dc5a6c" : "#2e2f30"
                font.pixelSize: 20
                anchors.centerIn: btn_sub.Center
            }

            background: Rectangle{
                color: btn_sub.checked ? "#2e2f30" : "#dc5a6c"
                radius: 4
            }

            onClicked: {
                if(btn_sub.checked)
                    Database.addPodcast(name,image,address)
                else
                    Database.removePodcast(name)
            }
            Component.onCompleted: console.log(Database.isSubscribed(name))
        }

        Rectangle{
            width: 200
            height: 200
            color: "transparent"
            ScrollView {
                id: view
                anchors.fill: parent
                clip: true

                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                Text {
                    text: ""
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "qrc:/fonts/Nexa Light.otf"
                }
            }
        }
    }


    ListView{
        id: episods
        model:modelxml
        keyNavigationWraps: true
        ScrollBar.vertical: ScrollBar {
            visible: true
            policy: ScrollBar.AsNeeded
            snapMode: ScrollBar.SnapAlways
        }
        anchors.left: desc.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        height: parent.height - 40
        anchors.margins: 20
        snapMode: ListView.NoSnap
        spacing: 10
        clip: true

        delegate:
            Podepisoderect {
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:13}
}
##^##*/
