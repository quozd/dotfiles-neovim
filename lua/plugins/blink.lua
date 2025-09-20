return {
    'saghen/blink.cmp',
    dependencies = {
        { "mikavilpas/blink-ripgrep.nvim", version = "*" },
    },
    version = '1.*',
    opts = {
        completion = {
            documentation = {
                auto_show = true,
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                }
            },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                        { "source_name" },
                    },
                },
            },
        },
        signature = {
            enabled = true,
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
            per_filetype = {
                sql = { "dadbod" },
            },
            providers = {
                dadbod = { module = "vim_dadbod_completion.blink" },
                ripgrep = {
                    module = "blink-ripgrep",
                    opts = {
                        backend = {
                            use = "gitgrep-or-ripgrep",
                        },
                    },
                },
            },
        },
        keymap = {
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
            ["<C-g>"] = {
                function()
                    require("blink-cmp").show({ providers = { "ripgrep" } })
                end,
            },
        },
        cmdline = {
            completion = { menu = { auto_show = true } },
        },
    }
}
