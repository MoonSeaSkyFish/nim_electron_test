import jsffi
import dom

let apitest {.importjs: "window.apitest".}: JsObject

let root = document.getElementById("root")
root.innerHtml = """
<div id="text1"></div>
<div id="text2"></div>
<div id="text3"></div>
"""

let text1 = document.getElementById("text1")
let text2 = document.getElementById("text2")
let text3 = document.getElementById("text3")

apitest.ipcTest1.invoke("test1", "hello?").then(proc (v:cstring) =
  text1.innerText = v
)

apitest.ipcTest2("good moning").then(proc (v:cstring) =
  text2.innerText = v
)

apitest.ipcTest3("Cat").then(proc (v:JsObject) =
  text3.innerText = v.you.to(cstring) & "\n"
  text3.innerText &= v.me.to(cstring)
)

