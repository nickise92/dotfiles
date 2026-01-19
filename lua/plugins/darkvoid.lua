return {
    "aliqyan-21/darkvoid.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "darkvoid",
            callback = function()
                local hl = vim.api.nvim_set_hl

                -- Rimuovi sfondi rossi/fastidiosi nei blocchi di codice
                hl(0, "MarkdownCode", { bg = "NONE" })
                hl(0, "MarkdownCodeBlock", { bg = "NONE" })
                hl(0, "@markup.raw.markdown_inline", { bg = "NONE", fg = "#bdfe58" })

                -- Personalizzazione Markdown (Treesitter)
                hl(0, "@markup.link.url.markdown_inline", { fg = "#1bfd9c", underline = true })
                hl(0, "@markup.link.label.markdown_inline", { fg = "#e1e1e1" })
                hl(0, "@markup.italic.markdown_inline", { italic = true, fg = "#66b2b2" })
                hl(0, "@markup.list.markdown", { fg = "#1bfd9c" })
                hl(0, "@markup.quote.markdown", { fg = "#585858", italic = true })

                -- Checkboxes
                hl(0, "@markup.list.unchecked.markdown", { fg = "#f1f1f1", bold = true })
                hl(0, "@markup.list.checked.markdown", { fg = "#bdfe58", bold = true })
            end,
        })

        require("darkvoid").setup({
            transparent = true,
            glow = true,
            show_end_buffer = true,

            colors = {
                fg = "#c0c0c0",
                bg = "#1c1c1c",
                cursor = "#bdfe58",
                line_nr = "#404040",
                visual = "#303030",
                comment = "#585858",
                string = "#d1d1d1",
                func = "#e1e1e1",
                kw = "#f1f1f1",
                identifier = "#b1b1b1",
                type = "#a1a1a1",
                type_builtin = "#c5c5c5", -- current
                -- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
                search_highlight = "#1bfd9c",
                operator = "#1bfd9c",
                bracket = "#e6e6e6",
                preprocessor = "#4b8902",
                bool = "#66b2b2",
                constant = "#b2d8d8",
            },

            -- enable or disable specific plugin highlights
            plugins = {
                -- gitsigns = true,
                -- nvim_cmp = true,
                treesitter = true,
                -- nvimtree = true,
                -- telescope = true,
                -- lualine = true,
                -- bufferline = true,
                oil = true,
                whichkey = true,
                nvim_notify = true,
            },
        })

        vim.cmd("colorscheme darkvoid")
    end,
}
