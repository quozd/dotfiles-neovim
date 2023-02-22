local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter_configs.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "comment",
        "dockerfile",
        "fish",
        "gitignore",
        "gitattributes",
        "go",
        "gomod",
        "graphql",
        "hcl",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "lua",
        "make",
        "markdown",
        "python",
        "sql",
        "toml",
        "typescript",
        "vim",
        "yaml"
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    --ignore_install = { "ocamllex", "teal" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,

    },
    indent = { enable = true, disable = { "yaml" } },
}
