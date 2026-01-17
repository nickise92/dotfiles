-- Change between light and dark colorscheme
vim.keymap.set("n", "<leader>uil", function()
    vim.cmd("colorscheme gruvbox-light")
end, { desc = "Switch to [UI] theme [L]ight" })
vim.keymap.set("n", "<leader>uid", function()
    vim.cmd("colorscheme gruvbox-hard")
end, { desc = "Switch to [UI] theme [D]ark" })

-- Open Lazy.nvim panel
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy floating panel" })
-- Open the File Explorer (Oil)
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory in Oil" })
-- Go to LSP diagnostic
vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Open Diagnostic in Float" })
-- Code format shortcut
vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({
        lsp_format = "fallback",
    })
end, { desc = "Format current file" })
-- Start live-preview for markdown document
vim.keymap.set("n", "<leader>ms", "<cmd>LivePreview start<CR>", { desc = "Start live preview for markdown file" })
-- Close live-preview for markdown document
vim.keymap.set("n", "<leader>mc", "<cmd>LivePreview close<CR>", { desc = "Close live preview for markdown file" })

-- Vimtex custom keybindings
vim.g.vimtex_mappings_enabled = 0 -- Disable default mapping to avoid confilcts

vim.keymap.set("n", "<leader>tc", "<cmd>VimtexCompile<CR>", { desc = "La[T]eX [C]ompile" })
vim.keymap.set("n", "<leader>tv", "<cmd>VimtexView<CR>", { desc = "La[T]eX [V]iew PDF" })
vim.keymap.set("n", "<leader>ts", "<cmd>VimtexStop<CR>", { desc = "La[T]eX [S]top Compilation" })
vim.keymap.set("n", "<leader>te", "<cmd>VimtexErrors<CR>", { desc = "La[T]eX show [E]rrors" })
vim.keymap.set("n", "<leader>tx", "<cmd>VimtexClean<CR>", { desc = "La[T]eX clean failed compilation files" })
