# live-reload.nvim

Live reload Neovim plugins with ease!

This plugin is very simple and works by clearing keys from the `package.loaded`
table so subsequent calls to require your plugin will not use the cached
require.

## Installation

Install with your favorite package manager (`packer` in this example).

```lua
use("mskelton/live-reload.nvim")
```

## Usage

Call `setup` to configure the plugin to watch your plugins. The main
configuration is the `plugins` table which accepts strings or tables describing
the plugins you want to live reload as well as their path on disk. If you pass
a string, the directory will be inferred from the `root_dir`, otherwise you can
pass a `dir` key to the table to specify the directory name.

```lua
require('live-reload').setup({
  root_dir = "~/dev",
  plugins = {
    "my-plugin",
    { "other-plugin", dir = "other-plugin.nvim" },
  },
})
```
