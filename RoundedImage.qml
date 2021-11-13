import QtQuick 2.0
import QtGraphicalEffects 1.0


Image {
    property int m_radius: 0
    id: img

    layer {
        enabled:  true
        effect: OpacityMask {
            maskSource: Rectangle{
                width: img.width
                height: img.height
                radius: m_radius
            }
        }
    }
}
