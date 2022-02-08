import jsffi

let electron = require("electron");
let contextBridge = electron.contextBridge
let ipcRenderer = electron.ipcRenderer

contextBridge.exposeInMainWorld(
  "apitest", JsObject{
    ipcTest1: ipcRenderer,
    ipcTest2: proc(msg:cstring):JsObject =
      ipcRenderer.invoke("test2", msg),
    ipcTest3: proc(msg:cstring):JsObject =
      ipcRenderer.invoke("test3", msg)
   }
);

