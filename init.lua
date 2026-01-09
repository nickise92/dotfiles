require("config.lazy")


-- Force Treesitter to start for Markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.treesitter.start()
    end,
})
