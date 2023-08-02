return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    opts = function()
        local cmp = require("cmp")

        return {
            completion = {
                completeopt = "menu,menuone,noselect,preview",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
                ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
                ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
                ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lsp_signature_help" },
            }, {
                { name = 'buffer' },
                { name = "path" },
            }),
            experimental = {
                ghost_text = true,
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
