return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },

        opts = {
            ensure_installed = {
                "php",
                "html",
                "css",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "typescript",
                "c",
                "python",
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            multiwindow = true,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = { "BufReadPost", "BufNewFile" },
    },
}
