import Quickshell // for ShellRoot and PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text

ShellRoot {
  PanelWindow {
    anchors {
      top: true
      left: true
      right: true
    }

    height: 30

    Text {
      // give the text an ID we can refer to elsewhere in the file
      id: clock

      // center the bar in its parent component (the window)
      anchors.centerIn: parent

      // create a process management object
      Process {
        // give it an id
        id: dateProc

        // the command it will run, every argument is its own string
        command: ["date"]

        // run the command immediately
        running: true

        // process the stdout stream using a SplitParser
        // which returns chunks of output after a delimiter
        stdout: SplitParser {
          // listen from the read signal, which returns the data that was read
          // from stdout, then write that data to the clock's text property
          onRead: data => clock.text = data
        }
      }
      Timer {
        // 1000 milliseconds is 1 second
        interval: 1000

        // start the timer immediately
        running: true

        // run the timer again when it ends
        repeat: true

        // when the timer is triggered, set the running property of the
        // process to true, which reruns it if stopped.
        onTriggered: dateProc.running = true
      }
    }
  }
}
