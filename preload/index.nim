import jsffi

let electron = require("electron")
let app = electron.app
let path = require("path")
let dirname {.importc: "__dirname", nodecl.}: cstring

app.whenReady().then(proc() = 
  let win = jsnew electron.BrowserWindow(
    JsObject{
      width: 800,
      height: 600,
      webPreferences: JsObject{
        preload: path.resolve(dirname, "preload.js")
      }
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