return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_organize_imports", "ruff_format" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "biome", "biome-organize-imports" },
            typescript = { "biome", "biome-organize-imports" },
            typescriptreact = { "biome", "biome-organize-imports" },
            dockerfile = { "dockerfmt" },
            go = { "gofmt", "goimports" },
            justfile = { "just" },
            sql = { "sqruff" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
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
