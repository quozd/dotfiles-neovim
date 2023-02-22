local status_ok, indentblankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

indentblankline.setup {
    show_current_context = false,
    show_current_context_start = false,
    use_treesitter = true,
}
