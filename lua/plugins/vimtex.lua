return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        --
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "C:/Users/user/AppData/Local/SumatraPDF/SumatraPDF.exe"

        -- Forward Search from code to pdf
        vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search "@tex" @line "@pdf"]]

        -- Inverse Search from pdf to code
        -- go to SumatraPDF -> Settings -> Options ->
        -- in the section titled with 'Set inverse search command-line'
        -- just put this: 'nvim --remote-silent +%l "%f"
    end,
}
