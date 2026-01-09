# Neovim configuration and setup

This neovim configuration is being build up incrementally from scratch following this [video series](https://youtube.com/playlist?list=PLy68GuC77sURrnMNi2XR1h58m674KOvLG&si=VJ9KEBJFEir5xOK6) as reference.

The list of the plugin that will be installed is in order, so if needed can be replicate. Any tweak or change from the original
configurations present in the video series will be documented here to keep the configuration organized and clean.

## The Plan

- [X] lazy.nvim    -- plugin manager
- [X] tokyonight.nvim   -- colorscheme
- [X] mini.statusline   -- statusbar on the bottom
- [X] oil.nvim  -- file browser -> keymapped to '-'
- [X] Basic options  -- line numbers, indent config and other basic settings
- [X] vim-sleuth    -- automatically set tabs or spaces based on the opened project content
- [X] mini.icons    -- dependency for another plugin, add icons.
- [X] editorconf    -- editorconfig file
- [ ] showkeys  -- plugin that show key pressed, sometimes break things, if needed has to be activate. 
- [X] treesitter.nvim     -- parser generator
- [X] treesitter-textobjects    -- Textobjects in Neovim are
- [X] fzflua    -- File finder
- [X] which-key
- [X] project.nvim          -- Detects the root directory of projects
- [X] LSP    -- Language Server Protocol
- [X] conform.nvim
- [ ] blink-cmp
- [ ] snacks.indent

## Keymaps

This section is about custom keymappings that can be find either in plugins lua file or in [keymaps.lua](.\lua\config\keymaps.lua).

- Opening Lazy.nvim dialog: `<leader>l`
- Opening File Explorer (default Oil.nvim): `-`
- ...

## Treesitter config
### Treesitter fix for Markdown files
In markdown treesitter doesn't start automatically, at least at the time these file are written.
In the init.lua file, (**at the very end of it!**) was added the following function to force the starting of the parser:

```lua
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.treesitter.start()
    end,
})
```

## Treesitter lua file change
The nvim-treesitter.lua is taken by [this repo](https://github.com/xaaha/dev-env/blob/main/nvim/.config/nvim/lua/xaaha/plugins/lsp-nvim-treesitter.lua) to solve some dependencies/versioning problem linked either to nvim-treesitter master-main branch switching or to
Windows OS and Terminal / PowerShell conflicts.

## Language Server Protocols LSP

### What is a LSP?

Is an open, JSON-RPC-based protocol for use between source code editors or integrated development environment (IDEs) and servers that provide
"language intelligence tools": programming language-specific features like code completion, syntax highlighting and marking of warnings and errors, 
as well refactoring routines. The goal of the protocol is to allow programming language support to be implemented and distributed independently of any given
editor or IDE. In the early 2020s, LSP quickly became a "norm" for language intelligence tools providers.
Source: Wikipedia, find more [here](https://en.wikipedia.org/wiki/Language_Server_Protocol)

### Current installed LSPs

- [X] Lua: lua_ls
- [X] C, C++: clangd
- [X] PHP: phpactor
- [X] Markdown: marksman
- [X] Json: jsonls
- [X] Python: pyright
- [X] CSS: cssls, cssmodules_ls
- [X] Bash: bashls
- [X] JavaScript & TypeScript: ts_ls

## Conform - Code Formatter

About the `php-cs-fixer` formatter for PHP, this fix was added from [reddit](https://www.reddit.com/r/neovim/comments/18a77w2/good_lintingformatting_configuration_for_php_in/#:~:text=%2D%2Dformatters%2Elua,true%2C%20%7D%2C%20%7D).

```lua
formatters = {
      ["php-cs-fixer"] = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
      },
    },
    notify_on_error = true,
```


## About Showkeys

This plugin is usefull to show within Neovim environment the key pressed while typing.
Since it will rise some errors times to time, if needed must be activated: to
do so, just create a `showkey.lua` file in the `plugins/` folder and then 
pouplate it with this lazy config:

```lua
return { 
    "nvzone/showkeys", 
    cmd = "ShowkeysToggle",
    opts={
        maxkeys=5
    }
}
```

And then decomment the last line in the `lazy.lua` file

```lua
-- After all initializations enable showkeys
vim.cmd("ShowkeysToggle")
```

