import QtQuick
import Quickshell
import Quickshell.Io
import qs.Common
import qs.Services
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
    id: root

    property string currentSubmap: "reset"

    // Proceso para escuchar eventos de Hyprland
    Process {
        id: submapListener
        command: [
            "sh", 
            "-c", 
            "socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | grep --line-buffered '^submap>>'"
        ]
        running: true

        stdout: SplitParser {
            onRead: data => {
                if (data.startsWith("submap>>")) {
                    root.currentSubmap = data.substring(8).trim()
                }
            }
        }
    }

    // Formateador
    function getDisplayLabel(submap) {
        if (!submap || submap === "reset" || submap === "") {
            return "NOR"
        }
        return submap.substring(0, 3).toUpperCase()
    }

		// Helper para determinar si está en estado normal
    function isNormalState(submap) {
        return !submap || submap === "reset" || submap === ""
    }

    // Píldora visible en la barra horizontal
    horizontalBarPill: Component {
        Item {
            implicitWidth: labelText.implicitWidth + Theme.spacingM
            implicitHeight: Theme.iconSize

            StyledText {
                id: labelText
                anchors.centerIn: parent
                text: root.getDisplayLabel(root.currentSubmap)
								color: root.isNormalState(root.currentSubmap) ? Theme.surfaceText : Theme.primary
                font.bold: true
                font.pixelSize: Theme.fontSizeSmall
            }
        }
    }

    // Píldora para barra vertical (por si cambias de diseño)
    verticalBarPill: Component {
        Item {
            implicitWidth: Theme.iconSize
            implicitHeight: labelTextVert.implicitHeight + Theme.spacingS

            StyledText {
                id: labelTextVert
                anchors.centerIn: parent
                text: root.getDisplayLabel(root.currentSubmap)
								color: root.isNormalState(root.currentSubmap) ? Theme.surfaceText : Theme.primary
                font.bold: true
                font.pixelSize: Theme.fontSizeSmall
            }
        }
    }
}
