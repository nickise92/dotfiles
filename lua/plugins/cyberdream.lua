return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = false,
            italic_comments = true,
            hide_fillchars = false,
            cache = false, -- better performance
            borderless_pickers = true,
            terminal_colors = true,
            theme = {
                variant = "default",
            },
            extensions = {
                telescope = true,
                notify = true,
                default = true,
                mini = true,
            },
        })
        vim.cmd("colorscheme cyberdream")
    end,
}
