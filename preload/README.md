# Nim Rlectron Context Isolation Example

Nim + Electron Context Isolation Example.

Use preload.

cf: https://www.electronjs.org/docs/latest/tutorial/context-isolation

## How to
```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/preload
% npm install
% nimble build
% nimble start
```

Or:

```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/preload
% npm install
% nim js index.nim
% nim js preload.nim
% nim js renderer.nim
% npx electron .
```

