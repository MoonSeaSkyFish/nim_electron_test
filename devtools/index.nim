import jsffi

let electron = require("electron")
let app = electron.app

app.whenReady().then(proc() = 
  let win = jsnew electron.BrowserWindow(
    JsObject{
      width: 800,
      height: 600
    }
  )
  when not defined(release):
    win.webContents.openDevTools()
  win.loadFile("index.html")
)

app.on("window-all-closed", proc() =
  if require("process").platform.to(cstring) != "darwin":
    app.quit()
)