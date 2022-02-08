import jsffi

let electron = require("electron");
let contextBridge = electron.contextBridge

contextBridge.exposeInMainWorld(
  "apitest", JsObject{
    testText: cstring"hello, preload test text.",
    testProc: proc (str: cstring) : cstring =
      result = cstring "hello! " & str,
    testProc2: proc (v1: cint, v2:cint) : cint =
      result = cint (v1 + v2),
    testProc3: proc (v1: cint, v2:cint, v3:cint) : cint =
      result = cint (v1 + v2 + v3)
   }
);

