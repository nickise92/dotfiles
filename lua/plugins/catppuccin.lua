return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "latte", -- Forza il tema chiaro
            transparent_background = false,
            integrations = {
                treesitter = true,
                native_lsp = { enabled = true },
                markdown = true,
            },
            highlight_overrides = {
                latte = function(c)
                    return {
                        ["@markup.link.url.markdown_inline"] = { fg = c.blue },
                        ["@markup.link.label.markdown_inline"] = { fg = c.pink },
                        ["@markup.italic.markdown_inline"] = { italic = true, fg = c.yellow },
                        ["@markup.raw.markdown_inline"] = { fg = c.green },
                        ["@markup.list.markdown"] = { fg = c.peach },
                        ["@markup.quote.markdown"] = { fg = c.overlay1, italic = true },
                        ["@markup.list.unchecked.markdown"] = { fg = c.red, bold = true },
                        ["@markup.list.checked.markdown"] = { fg = c.teal, bold = true },
                    }
                end,
            },
        })
        -- Imposta il default (puoi commentarlo se vuoi che rimanga Tokyonight all'avvio)
        -- vim.cmd.colorscheme("catppuccin-latte")
    end,
}
