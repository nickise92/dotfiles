return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp"
    event = "VeryLazy",

    config = function()
        local ls = require("luasnip")

        ls.config.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        -- CUSTOMS KEYMAP
        -- Expand snippet
        local set = vim.keymap.set
        set("i", "<C-K>", function()
            if ls.expandable() then
                ls.expand()
            end
        end, { silent = true })
        -- Jump next
        set({ "i", "s" }, "<C-L>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { silent = true })
        -- Jump previous
        set({ "i", "s" }, "<C-J>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
        -- Change choice
        set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        -- LOADERS:
        -- This load the snippet written in snippets/
        require("luasnip.loaders.from_lua").lazy_load({
            paths = "~/AppData/Local/nvim/snippets/",
        })

        -- To use friendly-snippets uncomment this:
        -- require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
