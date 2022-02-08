import jsffi

let electron = require("electron")
let app = electron.app
let path = require("path")
let dirname {.importc: "__dirname", nodecl.}: cstring
let ipcMain = electron.ipcMain
let fs = require("fs")

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

ipcMain.handle("test", 
  proc(event:JsObject, filename:cstring): JsObject =
    let content = fs.readFileSync(filename, "utf-8")
    return JsObject{"err":cstring"", "content":content}
)


