return {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            dim_inactive_windows = false,

            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true, -- Handle deprecated options automatically
                devicons = true,
                lualine = true,
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },

            groups = {
                -- UI Elements
                border = "gray",
                link = "purple_lite",
                panel = "bg_second",
            },
        })
        -- vim.cmd("colorscheme gruvbox-hard")
    end,
}
