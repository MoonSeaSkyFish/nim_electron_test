# Nim Electron print devtools

Nim + Electron print devtools.

Devtool in Browser. 

## How to
```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/devtools
% npm install
% nimble build
% nimble start
```

Or:

```
% git clone https://github.com/MoonSeaSkyFish/nim_electron_test.git
% cd nim_electron_test/devtools
% npm install
% nim js index.nim
% nim js renderer.nim
% npx electron .
```

## Option

Option release is Devtools removed:

```
nim js -d:release index.nim
```
 
