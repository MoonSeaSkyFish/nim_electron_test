import jsffi

let electron = require("electron");
let contextBridge = electron.contextBridge
let ipcRenderer = electron.ipcRenderer
let fs = require("fs")

contextBridge.exposeInMainWorld(
  "apitest", JsObject{
    fsTest1: require("fs"),
    fsTest2: proc(filename:cstring,
      callback:proc(err:JsObject, content:cstring)): JsObject =
        fs.readFile(filename, "utf-8", proc(err: JsObject, content:cstring) =
          callback(err, content)
        ),
    fsTest3: proc(filename:cstring):JsObject =
      ipcRenderer.invoke("test", filename)
   }
);

