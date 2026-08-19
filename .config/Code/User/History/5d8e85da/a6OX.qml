import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  anchors {
    top: false
    left: false
    right: false
    bottom: true
  }

  implicitHeight: 30

  Text {
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    text: "my shell"
  }
}