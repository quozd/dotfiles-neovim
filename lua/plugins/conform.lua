return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports", "gofmt" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "biome", "biome-organize-imports" },
            typescript = { "biome", "biome-organize-imports" },
            typescriptreact = { "biome", "biome-organize-imports" },
            dockerfile = { "dockerfmt" },
            justfile = { "just" },
            sql = { "sqruff" },
            python = function(bufnr)
                if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_format", "ruff_organize_imports" }
                else
                    return { "isort", "black" }
                end
            end,
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = {
            -- I recommend these options. See :help conform.format for details.
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format { async = true }
            end,
            mode = "",
            desc = "Format code"
        },
    },
}
