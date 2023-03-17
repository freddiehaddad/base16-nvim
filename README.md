# base16-nvim

[Base16 colorschemes][3] for [Neovim][1].

Over [200 themes][3] plus light/dark variations are available.

This plugin works without [base16-shell][2]. However, for hot colorscheme
switching, it is required.

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
```

### Manual Mode (specific colorscheme)

```lua
require("lazy").setup({
    -- colorscheme
    {
        "freddiehaddad/base16-nvim",
        opts = { colorscheme: "base16-tokyo-night-dark" },
    }
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
```

If your `theme_file` is not in the default location, update the
`base16_theme_file` field as well.

[1]: https://github.com/neovim/neovim
[2]: https://github.com/tinted-theming/base16-shell
[3]: https://github.com/tinted-theming/base16-schemes
