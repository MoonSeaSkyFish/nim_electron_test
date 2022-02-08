import jsffi

let electron = require("electron")
let app = electron.app
let path = require("path")
let dirname {.importc: "__dirname", nodecl.}: cstring
let ipcMain = electron.ipcMain

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

ipcMain.handle("test1", proc(e:JsObject, arg:JsObject):cstring =
  return arg.to(cstring) & "... ok?"
)

ipcMain.handle("test2", proc(e:JsObject, arg:cstring):cstring =
  return arg & "? but good afternoon."
)

ipcMain.handle("test3", proc(e:JsObject, arg:cstring):JsObject =
  return JsObject{"you":arg, "me":cstring"Dog"}
)
