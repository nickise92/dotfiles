return {
    "vimwiki/vimwiki",
    event = "VeryLazy",
    init = function()
        -- Queste variabili devono essere impostate PRIMA del caricamento del plugin
        vim.g.vimwiki_list = {
            {
                path = "C:/Users/user/kDrive/Project/dev-wiki", -- Cambia con il tuo percorso preferito
                syntax = "markdown",
                ext = ".md",
            },
        }
        -- Opzionale: disabilita il cambio di filetype se ti crea problemi con altri plugin Markdown
        vim.g.vimwiki_global_ext = 0
    end,
    keys = {
        --- Cerca tra i titoli dei file della Wiki
        {
            "<leader>wn",
            function()
                require("fzf-lua").files({ cwd = "C:/Users/user/kDrive/Project/dev-wiki/" })
            end,
            desc = "[W]iki [N]ote: search for a note inside Personal Wiki",
        },
        --- Cerca il TESTO dentro le note della wiki (Live Grep)
        {
            "<leader>wg",
            function()
                require("fzf-lua").live_grep({ cwd = "C:/Users/user/kDrive/Project/dev-wiki/" })
            end,
            desc = "[W]iki [G]rep: search for text inside notes",
        },
        --- Esecuzione del push su GitLab per sincronizzare la wiki
        {
            "<leader>wS",
            function()
                --}- 1. Otteniamo la data e ora corrente per il messaggio di commit
                local date = os.data("%Y-%m%d %H:%M")
                local msg = "Wiki Update: " .. date

                --- 2. Definiamo il comando shell (add, commit e push)
                --- Usiamo && cosi il se un comando fallisce, si ferma li.
                local cmd = "git -C C:/Users/user/kDrive/Project/dev-wiki/ add . && "
                    .. "git -C C:/Users/user/kDrive/Project/dev-wiki/ commit -m '"
                    .. msg
                    .. "' && "
                    .. "git -C C:/Users/user/kDrive/Project/dev-wiki/ push"

                print("Sincronizzazione Wiki in corso...")

                --- 3. Eseguiamo il comando in background
                vim.fn.jobstart(cmd, {
                    on_exit = function(_, code)
                        if code == 0 then
                            print("Wiki sincronizzata con successo su GitLab!")
                        else
                            print("Errore durante il push. Controlla il terminale.")
                        end
                    end,
                })
            end,
            desc = "[W]iki [S]ync: Push on GitLab",
        },
    },
}
