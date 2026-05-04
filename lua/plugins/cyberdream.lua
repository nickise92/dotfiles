return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            hide_fillchars = false,
            cache = true, -- better performance
            borderless_pickers = true,
            extensions = {
                default = true,
            },
        })
        vim.cmd("colorscheme cyberdream")
    end,
}
