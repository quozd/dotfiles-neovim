vim.lsp.enable({
    "lua_ls",
    "gopls",
    "pyright",
    "rust_analyzer",
    "typescript-language-server",
})

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy",
                extraArgs = { "--no-deps" }
            },
            diagnostics = {
                enable = true;
            },
            inlayHints = {
                bindingModeHints = {
                    enable = true;
                },
                chainingHints = {
                    enable = true;
                },
                closingBraceHints = {
                    enable = true;
                },
                closureCaptureHints = {
                    enable = true;
                },
                closureReturnTypeHints = {
                    enable = "always";
                },
                lifetimeElisionHints = {
                    enable = "skip_trivial",
                    useParameterNames = true
                },
            },
        },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        vim.keymap.set('n', 'gK', function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })
    end,
})

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        source = "if_many",
        current_line = true,
        spacing = 2,
    },
})
