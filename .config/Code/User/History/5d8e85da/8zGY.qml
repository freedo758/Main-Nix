import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io // for Process

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
    bottom: false
   Component.onCompleted: {
    if (this.WlrLayershell != null) {
      this.WlrLayershell.layer = WlrLayer.Bottom;
    }
  }
  }

  implicitHeight: 30

  Text {
    command: ["date"]
    running: true
    stdout : StdioCollector{
    onStreamFinished: clock.text = this.text
  }
  }
}