import jsffi
import dom

let apitest {.importjs: "window.apitest".}: JsObject
let testText {.importjs: "window.apitest.testText".}: cstring
proc testProc(str:cstring):cstring {.importjs: "window.apitest.testProc(#)".}
proc testProc2(v1:cint, v2:cint):cint {.importjs: "window.apitest.testProc2(#, #)".}
proc testProc3(v1:cint, v2:cint, v3:cint):cint {.importjs: "window.apitest.testProc3(#, #, #)".}
proc testProc4(v1:cint, v2:cint, v3:cint):cint {.importjs: "window.apitest.testProc3(@)".}

let root = document.getElementById("root")
root.innerText = apitest.testText.to(cstring) & "\n"
root.innerText &= apitest.testProc("renderer").to(cstring) & "\n"
root.innerText &= testText  & "\n"
root.innerText &= testProc(cstring"renderer 2") & "\n"
root.innerText &= $testProc2(1, 2) & "\n"
root.innerText &= $testProc3(1, 2, 3) & "\n"
root.innerText &= $testProc4(2, 3, 4) 

