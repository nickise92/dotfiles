return {
    "epwalsh/obsidian.nvim",
    version = "*", -- use latest release
    lazy = true,
    -- Load the plugin when a Markdown (.md) file is open
    ft = "markdown",
    -- Or when one of these command is used
    cmd = {
        "ObsidianNew",
        "ObsidianSearch",
        "ObsidianToday",
        "ObsidianLink",
        "ObsidianOpen",
    },

    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "knowledge",
                path = "C:/Users/user/kDrive/Knowledge",
            },
        },

        -- Daily notes
        daily_notes = {
            folder = "00_Inbox",
            date_format = "%Y-%m-%d",
            template = "daily_template.md",
        },

        -- Imposta il titolo della nota senza id strani aggiunti da neovim
        note_id_func = function(title)
            return title
        end,
    },
}
