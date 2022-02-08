# Nim Electron IPC

Nim + Electron IPC.

Communicate asynchronously from the main process to renderer processes and
Communicate asynchronously from a renderer process to the main process.

## Use method
- ipcMain.handle
- ipcRenderer.invoke


## How to
```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/ipc
% npm install
% nimble build
% nimble start
```

Or:

```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/ipc
% npm install
% nim js index.nim
% npx electron .
```

## Reference
- https://www.electronjs.org/docs/latest/api/ipc-main
- https://www.electronjs.org/docs/latest/api/ipc-renderer
- https://www.electronjs.org/docs/latest/tutorial/context-isolation

