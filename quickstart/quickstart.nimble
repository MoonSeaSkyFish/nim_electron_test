# Package

version       = "0.1.0"
author        = "Moonsea Skyfish"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "./"
binDir        = "./"
backend       = "js"
bin           = @["index"]

# Dependencies

requires "nim >= 1.6.2"

task start, "start electron":
  exec "npx electron ."
