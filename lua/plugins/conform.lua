return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            php = { "php-cs-fixer" },
            tex = { "latexindent" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
        -- Fix taken from reddit, reference in the README!
        formatters = {
            ["php-cs-fixer"] = {
                command = "php-cs-fixer",
                args = {
                    "fix",
                    "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
                    "$FILENAME",
                },
                stdin = false,
            },
        },
        notify_on_error = true,
    },
}
