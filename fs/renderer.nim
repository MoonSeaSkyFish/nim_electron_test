import jsffi
import dom

let apitest {.importjs: "window.apitest".}: JsObject
let fs = apitest.fsTest1

let root = document.getElementById("root")
root.innerHtml = """
<div id="text1"></div>
<div id="text2"></div>
<div id="text3"></div>
"""

let text1 = document.getElementById("text1")
let text2 = document.getElementById("text2")
let text3 = document.getElementById("text3")

fs.readFile("test1.txt", "utf-8",
  proc (err:JsObject, content: cstring) =
    text1.innerText =  content
)

apitest.fsTest2("test2.txt", 
  proc (err:JsObject, content: cstring) =
    text2.innerText =  content
)


apitest.fsTest3("test3.txt").then(proc (v:JsObject) =
  text3.innerText = v.content.to(cstring)
)
