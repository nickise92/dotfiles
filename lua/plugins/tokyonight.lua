return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            light_style = "day",
            terminal_colors = true,
            transparent = true, -- set to true if you want transparency
            cache = true, -- better performance

            -- Adding better highlighting for markdown files
            -- @param hl highlights table
            -- @param c colors palette
            on_highlights = function(hl, c)
                hl["@markup.link.url.markdown_inline"] = { fg = c.blue1 }
                hl["@markup.link.label.markdown_inline"] = { fg = c.magenta }
                hl["@markup.italic.markdown_inline"] = { italic = true, fg = c.yellow }
                hl["@markup.raw.markdown_inline"] = { fg = c.green }
                hl["@markup.list.markdown"] = { fg = c.orange }
                hl["@markup.quote.markdown"] = { fg = c.comment, italic = true }

                -- Checkboxes
                hl["@markup.list.unchecked.markdown"] = { fg = c.red, bold = true }
                hl["@markup.list.checked.markdown"] = { fg = c.green1, bold = true }
            end,
        })
        --        vim.cmd("colorscheme tokyonight")
    end,
}
