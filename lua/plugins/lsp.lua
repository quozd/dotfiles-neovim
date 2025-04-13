local map = function(mode, lhs, rhs, bufnr, desc, opts)
    opts = opts or { noremap = true, silent = true }
    opts.desc = desc
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
end

return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        {
            "williamboman/mason.nvim",
            cmd = { "Mason" },
            build = ":MasonUpdate",
            opts = {
                ensure_installed = {
                    "gopls",
                    "pyright",
                    "rust-analyzer",
                    "typescript-language-server",
                    "tailwindcss-language-server",
                    "html-lsp",
                    "helm-ls",
                    "dockerfile-language-server",
                    "lua-language-server",
                },
            },
        },
        -- {
        --     "lvimuser/lsp-inlayhints.nvim",
        --     opts = {},
        -- },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local cmplsp = require("cmp_nvim_lsp")
        require("mason").setup()
        local mlsp = require("mason-lspconfig")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmplsp.default_capabilities()
        )

        local on_attach = function(client, bufnr)
            local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
            if client.supports_method('textDocument/inlayHint') then
                -- if client.server_capabilities and client.server_capabilities.inlayHintsSupport then
                if type(inlay_hint) == 'function' then
                    inlay_hint(bufnr, true)
                elseif type(inlay_hint) == 'table' and inlay_hint.enable then
                    inlay_hint.enable(true, { bufnr = buf })
                end
            end

            -- require("lsp-inlayhints").on_attach(client, bufnr)

            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Actions
            map('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufnr, "Format code")
            map('n', '<leader>cr', vim.lsp.buf.rename, bufnr, "Rename")
            map('n', '<leader>ca', vim.lsp.buf.code_action, bufnr, "Code actions")

            -- Diagnostics
            map("n", "<leader>dd", vim.diagnostic.open_float, bufnr, "Show diagnostic")
            map("n", "<leader>dk", vim.diagnostic.goto_prev, bufnr, "Prev diagnostic")
            map("n", "<leader>dj", vim.diagnostic.goto_next, bufnr, "Next diagnostic")
            map("n", "<leader>dq", vim.diagnostic.setloclist, bufnr, "Diagnostics loclist")

            -- GoTo
            map('n', 'gD', vim.lsp.buf.declaration, bufnr, "Go to declaration")
            map('n', 'gd', vim.lsp.buf.definition, bufnr, "Go to definition")
            map('n', 'gi', vim.lsp.buf.implementation, bufnr, "Go to implementation")
            map('n', 'gr', vim.lsp.buf.references, bufnr, "Show references")

            -- Misc
            map('n', 'K', vim.lsp.buf.hover, bufnr, "Show help")
        end

        mlsp.setup({
            handlers = {
                -- default handler (optional)
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup({
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { "vim" }
                                },
                                workspace = {
                                    -- Make the server aware of Neovim runtime files
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                            }
                        },
                        capabilities = capabilities,
                    })
                end,
                ["pyright"] = function()
                    lspconfig["pyright"].setup({
                        on_attach = on_attach,
                        flags = { debounce_text_changes = 300, },
                        capabilities = capabilities,
                    })
                end,
                ["rust_analyzer"] = function()
                    lspconfig["rust_analyzer"].setup {
                        on_attach = on_attach,
                        settings = {
                            inlayHints = {
                                enabled = true,
                                typeHints = {
                                    enable = true,
                                },
                            },
                        },
                        capabilities = capabilities,
                    }
                end,
                ["gopls"] = function()
                    lspconfig["gopls"].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            gopls = {
                                ["ui.hints"] = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                }
                            },
                        },
                    })
                end
            }
        })
    end,
}
