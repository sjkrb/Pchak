import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0

Rectangle{
    id : podepisoderect
    height: 50
    width: podepisoderect.ListView.view.width
    color: "#0B2534"
    radius: 5
    Row{
        spacing: 5
        anchors.fill: parent
        height: 50
        RoundedImage{
            width: 50
            height: 50
            z : 3
            source: model_image
            m_radius: 5
        }

        Label {
            id: txt
            z : 2
            anchors.leftMargin: 10
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            text: model_title


            FontMetrics{
                id : fntmtr
                font: txt.font
            }

            property int len: fntmtr.advanceWidth(txt.text)

            SequentialAnimation{
                id : txt_animator
                XAnimator {
                    target: txt
                    from: 60 // image with margin
                    to: parent.width - txt.len - 5
                    duration: 3000
                }
                XAnimator {
                    target: txt
                    from: parent.width - txt.len - 5
                    to: 60 // image with margin
                    duration: 3000
                }
                Component.onCompleted: console.log("implicit"+txt.len +" "+ parent.width)
            }

        }

    }

    MouseArea{
        id : area
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
        }

        onEntered: {
            if(txt.len > podepisoderect.width - 60)
            {
                txt_animator.start()
            }
            podepisoderect.color =  "#0E3045"
        }
        onExited: {
            txt_animator.complete()
            podepisoderect.color = "#0B2534"
        }
    }
}
