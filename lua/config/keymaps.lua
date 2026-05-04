-- Change between light and dark colorscheme
vim.keymap.set("n", "<leader>st", function()
    local cyber = require("cyberdream")
    -- Execute Cyberdream native command
    vim.cmd("CyberdreamToggleMode")

    -- Optional: print a feedback
    print("Theme switched Light/Dark")
end, { desc = "Toggle Cyberdream Light/Dark" })

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
        async = true,
        lsp_format = "fallback",
    })
end, { desc = "Format current file (async)" })
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

-- Multi lines indentation / de-indentation with Tab and Shift+Tab (VSCode like)
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "De-Indent selection" })

-- Java keybindings
-- Build & Workspace
vim.keymap.set(
    "n",
    "<leader>jbbw",
    "<cmd>JavaBuildBuildWorkspace<CR>",
    { desc = "Run the [J]ava[B]uildBuild[W]orkspace command" }
)
vim.keymap.set(
    "n",
    "<leader>jbcw",
    "<cmd>JavaBuildCleanWorkspace<CR>",
    { desc = "Run the [J]ava[B]uild[C]lean[W]orkspace command" }
)

-- Run program
vim.keymap.set("n", "<leader>jrm", "<cmd>JavaRunnerRunMain<CR>", { desc = "Run command: [J]avaRunner[R]un[M]ain" })
vim.keymap.set("n", "<leader>jsm", "<cmd>JavaRunnerStopMain<CR>", { desc = "Run command: [J]avaRunner[S]top[M]ain" })

-- Open a new Tab into the current directory (LUA version)
vim.keymap.set("n", "<leader>bt", function()
    local current_file_dir = vim.fn.expand("%:p:h")

    -- 1. Crea la nuova Tab
    vim.cmd("tabnew")

    -- 2. Cambia la directory locale (solo per questa tab)
    if current_file_dir ~= "" and vim.fn.isdirectory(current_file_dir) == 1 then
        pcall(function()
            vim.cmd("lcd " .. vim.fn.fnameescape(current_file_dir))
        end)
    end

    -- 3. Apri la ricerca file con fzf-lua
    require("fzf-lua").files()
end, { desc = "[B]uffer [T]ab on current directory" })

-- Open a new Vertical Split into the current directory
vim.keymap.set("n", "<leader>bv", function()
    local current_file_dir = vim.fn.expand("%:p:h")

    vim.cmd("vsplit")

    -- Controlla se la directory è valida e non è un buffer speciale
    if current_file_dir ~= "" and vim.fn.isdirectory(current_file_dir) == 1 then
        pcall(function()
            vim.cmd("lcd " .. vim.fn.fnameescape(current_file_dir))
        end)
    end

    require("fzf-lua").files()
end, { desc = "[B]uffer [V]Split in current directory" }) -- Open a new Horizontal Split into the current directory

vim.keymap.set("n", "<leader>bh", function()
    local current_file_dir = vim.fn.expand("%:p:h")

    vim.cmd("split")

    if current_file_dir ~= "" and vim.fn.isdirectory(current_file_dir) == 1 then
        pcall(function()
            vim.cmd("lcd " .. vim.fn.fnameescape(current_file_dir))
        end)
    end

    require("fzf-lua").files()
end, { desc = "[B]uffer [H]orizontal Split in current directory" })

-- Open a new buffer nella directory corrente
vim.keymap.set("n", "<leader>bn", function()
    require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "[B]uffer [N]ew: Open a new buffer in current directory" })

--- OBSIDIAN ---
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "[O]bsidian [N]ew note: create a new note" })
vim.keymap.set(
    "n",
    "<leader>os",
    "<cmd>ObsidianSearch<CR>",
    { desc = "[O]bsidian [S]earch: search text in all the notes" }
)
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "[O]bsidian [T]oday: go to daily note" })
vim.keymap.set(
    "v",
    "<leader>ol",
    "<cmd>ObsidianLink<CR>",
    { desc = "[O]bsidian [L]ink: create a link from selected text" }
)
vim.keymap.set(
    "n",
    "<leader>oo",
    "<cmd>ObsidianOpen<CR>",
    { desc = "[O]bsidian [O]pen: open current note in Obsidian GUI" }
)
