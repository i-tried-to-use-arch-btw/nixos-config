import { App, Widget } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widget/Bar"
import Applauncher from "./widget/Applauncher"
import NotificationPopups from "./notifications/NotificationPopups"
import OSD from "./osd/OSD"
import MprisPlayers from "./widget/MediaPlayer"

App.start({
  css: style,
  main() {
    App.get_monitors().map(Bar)
    Applauncher()
    App.get_monitors().map(NotificationPopups)
    App.get_monitors().map(OSD)
    new Widget.Window({}, MprisPlayers())
  },
})
