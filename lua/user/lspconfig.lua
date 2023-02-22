local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local cmplsp_status_ok, cmplsp = pcall(require, "cmp_nvim_lsp")
if not cmplsp_status_ok then
    return
end

local nullls_status_ok, nullls = pcall(require, "null-ls")
if not nullls_status_ok then
    return
end

local inlayhints_ok, inlayhints = pcall(require, "lsp-inlayhints")
if not inlayhints_ok then
    return
end

mason_lspconfig.setup()
inlayhints.setup()

local util = require('lspconfig/util')
require("user.lspconfig_python")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = cmplsp.default_capabilities()

mason_lspconfig.setup_handlers {
    function (server_name) -- default handler (optional)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["sumneko_lua"] = function()
        lspconfig["sumneko_lua"].setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    }
                }
            },
            capabilities = capabilities,
        }
    end,
    ["pyright"] = function()
        lspconfig["pyright"].setup {
            before_init = function(_, config)
                local pythonPath
                local venv = find_python_virtualenv(config.root_dir)

                if venv ~= nil then
                    pythonPath = util.path.join(venv, "bin", "python")
                else
                    pythonPath = exepath('python3') or exepath('python') or 'python'
                end

                config.settings.python.pythonPath = pythonPath
            end,
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["rust_analyzer"] = function ()
        lspconfig["rust_analyzer"].setup {
            on_attach = on_attach,
            settings = {
                inlayHints = {
                    enabled = true,
                    typeHints = {
                        enable = true,
                    },
                },
            }
        }
    end,
}

nullls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    sources= {
        nullls.builtins.diagnostics.golangci_lint,
        nullls.builtins.diagnostics.mypy.with({
            dynamic_command = function(params)
                local command
                local venv = find_python_virtualenv(params.root)
                if venv ~= nil then
                    command = util.path.join(venv, "bin", params.command)
                else
                    command = params.command
                end

                return command
            end,
        }),
        nullls.builtins.diagnostics.flake8,
        nullls.builtins.formatting.isort,
        nullls.builtins.formatting.black,
        nullls.builtins.formatting.rustfmt,
        nullls.builtins.formatting.prettierd,
        nullls.builtins.code_actions.gitsigns,
    },
    diagnostics_format = "[#{c}] #{m} (#{s})"
}

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
