# base16-nvim

[Base16 colorschemes][3] for [Neovim][1].

Over [200 themes][3] plus light/dark variations are available.

This plugin works without [base16-shell][2]. However, for hot colorscheme
switching, it is required.

Demonstration switching between three themes:

https://user-images.githubusercontent.com/6127369/226068278-d6c9b920-176e-4acb-b1c6-e15b43490296.mp4

## Default Configuration

```lua
{
    -- colorscheme for manual mode
    colorscheme = "base16-default-dark",
    -- hot mode
    hot_reload = {
        -- set to enabled
        enabled = false,
        -- path to the base16-shell theme_file (this is the default)
        base16_theme_file = "~/.config/tinted-theming/theme_name",
    },
}
```

## Plugin Configuration

### Manual Mode (default)

```lua
require("lazy").setup({
    -- colorscheme
    {
        "freddiehaddad/base16-nvim",
        opts = {},
    }
})
```

### Manual Mode (specific colorscheme)

```lua
require("lazy").setup({
    -- colorscheme
    {
        "freddiehaddad/base16-nvim",
        opts = { colorscheme: "base16-tokyo-night-dark" },
    }
})
```

### Hot Mode

```lua
require("lazy").setup({
    -- colorscheme
    {
        "freddiehaddad/base16-nvim",
        opts = {
            hot_reload = {
               enabled = true,
            },
        }
    }
})
```

If your `theme_file` is not in the default location, update the
`base16_theme_file` field as well.

## Accessing Colorscheme Colors

If you want to make use of the colors for the currently loaded, colorscheme,
`base16-nvim` sets the following global variables each time a colorscheme is selected.

```vim
" Formatted in RGB hexadecimal (i.e. FF0000)
vim.g.base16_gui00 " black
vim.g.base16_gui01
vim.g.base16_gui02
vim.g.base16_gui03
vim.g.base16_gui04
vim.g.base16_gui05 " white
vim.g.base16_gui06
vim.g.base16_gui07 " bright white
vim.g.base16_gui08 " red
vim.g.base16_gui09
vim.g.base16_gui0A " yellow
vim.g.base16_gui0B " green
vim.g.base16_gui0C " cyan
vim.g.base16_gui0D " blue
vim.g.base16_gui0E " magenta
vim.g.base16_gui0F
```

## Notification of Colorscheme Changes

`base16-nvim` offers a notification mechanism for those needing to receive
updates whenever the colorscheme changes.

Note that you will only be notified on subsequent colorscheme updates. A
notification will not be sent for the initial setup.

```lua
local update_theme = function(colorscheme)
    vim.notify("colorscheme changed to " .. colorscheme)

    local theme = {
        fg = "#" .. vim.g.base16_gui05,
	bg = "#" .. vim.g.base16_gui00,
        base00 = "#" .. vim.g.base16_gui00, -- black
        base01 = "#" .. vim.g.base16_gui01,
        base02 = "#" .. vim.g.base16_gui02,
        base03 = "#" .. vim.g.base16_gui03,
        base04 = "#" .. vim.g.base16_gui04,
        base05 = "#" .. vim.g.base16_gui05, -- white
        base06 = "#" .. vim.g.base16_gui06,
        base07 = "#" .. vim.g.base16_gui07, -- bright white
        base08 = "#" .. vim.g.base16_gui08, -- red
        base09 = "#" .. vim.g.base16_gui09,
        base0A = "#" .. vim.g.base16_gui0A, -- yellow
        base0B = "#" .. vim.g.base16_gui0B, -- green
        base0C = "#" .. vim.g.base16_gui0C, -- cyan
        base0D = "#" .. vim.g.base16_gui0D, -- blue
        base0E = "#" .. vim.g.base16_gui0E, -- magenta
        base0F = "#" .. vim.g.base16_gui0F,
        black = "#" .. vim.g.base16_gui00,
        skyblue = "#" .. vim.g.base16_gui0D,
        cyan = "#" .. vim.g.base16_gui0C,
        green = "#" .. vim.g.base16_gui0B,
        oceanblue = "#" .. vim.g.base16_gui0D,
        magenta = "#" .. vim.g.base16_gui0E,
        orange = "#" .. vim.g.base16_gui0A,
        red = "#" .. vim.g.base16_gui08,
        violet = "#" .. vim.g.base16_gui0E,
        white = "#" .. vim.g.base16_gui05,
        yellow = "#" .. vim.g.base16_gui0A,
    }

    require("feline").use_theme(colors)
end

require("base16-nvim").listen(update_theme)
```

[1]: https://github.com/neovim/neovim
[2]: https://github.com/tinted-theming/base16-shell
[3]: https://github.com/tinted-theming/base16-schemes
