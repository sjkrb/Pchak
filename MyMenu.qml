import QtQuick 2.0
import QtQuick.Controls 2.5
//import netFace 0.1


Rectangle {

    id: menuRect
    color: "#0B2534"

    signal btnClk(int id)
    function resetColor()
    {
        btn_refresh.color =  menuRect.color
        btn_plus.color    =  menuRect.color
        btn_import.color  =  menuRect.color
        btn_export.color  =  menuRect.color
        btn_search.color  =  menuRect.color
        btn_setting.color =  menuRect.color
        btn_help.color    =  menuRect.color
        btn_info.color    =  menuRect.color
    }

    onBtnClk:
    {
        resetColor()
            switch (id)
            {
            case 0:
                //refresh
                btn_refresh.color =  "#0A222E"
                pusher("qrc:/MainView.qml",{})
                console.log(0)

                break
            case 1:
                //add
                btn_plus.color    =  "#0A222E"
                console.log(1)
                break
            case 2:
                //import
                btn_import.color  =  "#0A222E"
                console.log(2)
                break
            case 3:
                //export
                btn_export.color  =  "#0A222E"
                console.log(3)
                break
            case 4:
                //search
                btn_search.color  =  "#0A222E"
                pusher("qrc:/SearchView.qml",{})
                console.log(4)

                break
            case 5:
                //setting
                btn_setting.color =  "#0A222E"
                console.log(5)

                break
            case 6:
                //help
                btn_help.color    =  "#0A222E"
                console.log(6)

                break
            case 7:
                //about
                btn_info.color    =  "#0A222E"
                console.log(7)

                break
            default:
                break
            }
        }


    Column{
        anchors.fill:parent
        spacing: 2

        MenuBottons{
            id: btn_refresh
            icon :  "qrc:/icons/refresh"
            txt : "Refresh"
            workNum: 0
        }

        MenuBottons{
            id: btn_plus
            icon :  "qrc:/icons/plus"
            txt : "Add new"
            workNum: 1
        }

        MenuBottons{
            id: btn_import
            icon :  "qrc:/icons/import"
            txt : "Import"
            workNum: 2
        }

        MenuBottons{
            id: btn_export
            icon :  "qrc:/icons/export"
            txt : "Export"
            workNum: 3
        }

        MenuBottons{
            id: btn_search
            icon :  "qrc:/icons/search"
            txt : "Search"
            workNum: 4
        }

        MenuBottons{
            id: btn_setting
            icon :  "qrc:/icons/setting"
            txt : "Setting"
            workNum: 5
        }

        MenuBottons{
            id: btn_help
            icon :  "qrc:/icons/help"
            txt : "Help"
            workNum: 6
        }

        MenuBottons{
            id: btn_info
            icon :  "qrc:/icons/info"
            txt : "About"
            workNum: 7
        }




    }
}
