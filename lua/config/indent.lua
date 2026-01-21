vim.api.nvim_create_autocmd("FileType", {
    pattern = { "php", "phtml" },
    callback = function()
        -- Disable Vim legacy indent (GetPhpIndent)
        vim.bo.indentexpr = "treesitter#indent()"

        -- Settings
        vim.bo.autoindent = true
        vim.bo.smartindent = false
        vim.bo.cindent = false

        -- Restore indentkeys
        vim.bo.indentkeys = "0{,0},:,0#,!^F,o,O,e"
    end,
})
