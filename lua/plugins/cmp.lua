return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "lukas-reineke/cmp-under-comparator",
        "lukas-reineke/cmp-rg",
    },
    opts = function()
        local cmp = require("cmp")

        return {
            preselect = cmp.PreselectMode.None,
            completion = {
                completeopt = "menu,menuone,noselect,noinsert,preview",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
                ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
                ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
                ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
            },
            sources = cmp.config.sources({
                { name = "path", priority = 110 },
                { name = "nvim_lsp", priority = 100},
                -- { name = "luasnip" },
                { name = "nvim_lsp_signature_help", priority = 100},
                { name = "nvim_lsp_document_symbol", priority = 70 },
                {
                    name = "rg",
                    keyword_length = 5,
                    max_item_count = 5,
                    priority = 60,
                    option = {
                        additional_arguments = "--smart-case --hidden",
                        set_filetype = true,
                    },
                    -- entry_filter = function(entry)
                    --     return not entry.exact
                    -- end,
                },
                { name = "buffer", priority = 50 },
            }),
            sorting = {
                priority_weight = 100,
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require "cmp-under-comparator".under,
                    cmp.config.compare.kind,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            experimental = {
                ghost_text = false,
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")

        cmp.setup(opts)

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline("/", {
            sources = {
                { name = 'buffer' },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' },
            }),
        })
    end,
}
