return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
        provider = "gemini",
        providers = {
            gemini = {
                model = "gemini-2.5-flash", -- Qui non scappa, usa questo!
                max_tokens = 4096,
            },
        },
    },
    build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            -- Supporto per le icone e i colori
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_markdown = true,
                },
            },
        },
    },
}
