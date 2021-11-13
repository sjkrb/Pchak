import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQml.Models 2.12

TextField {
    id: searchBar
    width: parent.width * 0.70
    height: 30
    layer.smooth: false
    anchors.top: parent.top
    anchors.topMargin: 10
    anchors.horizontalCenter:  parent.horizontalCenter
    color: "white"
    placeholderText: qsTr("search")
    z : 1

    background:Rectangle{
        color: "#111d33"
        radius: 12
        border.color: "#1b2433"
        border.width: 3
    }

    onEditingFinished: {

        model.clear()
        let xnr = new XMLHttpRequest();
        let serach_prase = searchBar.text.replace(" ","+");
        xnr.open("GET","https://itunes.apple.com/search?term="+serach_prase+"&media=podcast&entry=podcast&attribute=titleTerm")
        xnr.onreadystatechange = function() {
            if (xnr.readyState === XMLHttpRequest.DONE) {
                txt = JSON.parse(xnr.responseText);
                let list = txt.results
                for(var i in list)
                {
                    model.append({pod_image: list[i]["artworkUrl600"], pod_name: list[i]["collectionName"],pod_address: list[i]["feedUrl"]});
                }
            }
        }
        xnr.send();
        console.log(txt)
    }


    selectByMouse: true
    MouseArea{
        anchors.fill:  parent
        cursorShape: Qt.IBeamCursor
        onHoveredChanged: searchBar.hovered ? searchBar.forceActiveFocus() : searchBar.focus = false
        onDoubleClicked: searchBar.selectAll()
        onClicked: requestActivate()
    }


}
