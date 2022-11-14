local ts_status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not ts_status_ok then
    return
end

ts.setup {
  ensure_installed = {"bash", "comment", "dockerfile", "fish", "gitignore", "gitattributes", "go", "gomod", "graphql", "hcl", "html", "java", "javascript", "json", "json5", "lua", "make", "markdown", "python", "sql", "toml", "typescript", "vim", "yaml"},
  sync_install = false,
  --ignore_install = { "ocamllex", "teal" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
