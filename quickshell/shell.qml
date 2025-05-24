import Quickshell
import Quickshell.Io
import QtQuick

ShellRoot {
  PanelWindow {
    anchors {
      top: true
      right: true
      left: true
    }

    implicitHeight: 30

    Text {
      id: clock
      anchors.centerIn: parent

      Process {
        id: dateProc

        command: ["date"]

        running: true

        stdout: SplitParser {
          onRead: data => clock.text = data
        }
      }
      
      Timer {
        interval: 1000

        running: true

        repeat: true

        onTriggered: dateProc.running = true
      }
    }
  }
}
