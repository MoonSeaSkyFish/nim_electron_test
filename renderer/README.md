# Nim Electron Renderer Example

Nim + Electron renderer.

## How to
```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/renderer
% npm install
% nimble build
% nimble start
```

Or:

```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/renderer
% npm install
% nim js index.nim
% nim js renderer.nim
% npx electron .
```

## Point
JavaScript Src:

```
var root = document.getElementById("root")
root.innerText = "Hello, Electron DOM."
```

Converted Nim Src is renderer.nim:

```
import dom

let root = document.getElementById("root")
root.innerText = "Hello, Electron DOM."
```



