import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{
    id:btn
    width: parent.width
    height: 50
    color: menuRect.color


    property string icon: ""
    property string txt: ""
    property int workNum;

    Image {
        id : btn_img
        //        source: "qrc:/icons/refresh"
        source: icon
        smooth: true
        width: 30
        height: 30
        anchors.horizontalCenter:parent.horizontalCenter
    }

    Text {
        id : btn_txt
        text: qsTr(txt)
        color: "#dadde8"
        anchors.top: btn_img.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        fontSizeMode: Text.Fit
        font.pixelSize: 11
    }

    MouseArea
    {
        id: area
        anchors.fill: parent
        //        onClicked: calculate(workNum)
        onClicked: {
            btnClk(workNum)
        }


        //somemore things
    }
}
