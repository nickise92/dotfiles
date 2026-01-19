return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        render_modes = { "n", "c", "t" },
        code = {
            -- Remove red background on code-blocks
            highlight = "Normal",
            style = "full",
            left_pad = 2,
            right_pad = 2,
            border = thin,
        },
    },
}
