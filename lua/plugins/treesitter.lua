return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install {
            "comment",
            "dockerfile",
            "gitattributes",
            "gitignore",
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
            "markdown_inline",
            "python",
            "rust",
            "sql",
            "toml",
            "typescript",
            "vim",
            "yaml"
        }
    end,
}
