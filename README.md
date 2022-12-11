# live-reload.nvim

Live reload Neovim plugins for easier development!

This plugin is very simple and works by clearing `package.loaded`

## Installation

Install with your favorite package manager (`packer` in this example).

```lua
use("mskelton/live-reload.nvim")
```

## Usage

Call `setup` to configure the `LiveReload` command.

```lua
require('live-reload.nvim').setup()
```

With the plugin setup, you can now call the `LiveReload` command to begin watching files for changes. By default, this command will watch the current working directory, but it accepts a single argument if you would like to watch an arbitrary directory.

```vim
" Watch the current working directory
:LiveReload

" Watch an arbitrary directory
:LiveReload ~/dev/my-plugin

" Watch the directory of the active buffer
:LiveReload expand('%:p:h')
```
