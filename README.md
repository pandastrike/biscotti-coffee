# Biscotti Coffee

Like M4, but with CoffeeScript.

# Install

`npm i -s biscotti-coffee`

# Usage

```coffee
import processor from "biscotti-coffee"

# pass in require function as a global
# so import will work
render = processor {require}
render path: "./template/hello-world.biscotti"
```
