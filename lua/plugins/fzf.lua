return {
    "ibhagwan/fzf-lua",
    init = function()
        local map = require("utils.keymap").map
        map("n", "<leader>ff", ":FzfLua files<CR>", "Find file")
        map("n", "<leader>fg", ":FzfLua live_grep<CR>", "Find in files")
        map("n", "<leader>fb", ":FzfLua buffers<CR>", "Find buffer")
        map("n", "<leader>fs", ":FzfLua lsp_document_symbols<CR>", "Find symbol")
        map("n", "<leader>fdf", ":FzfLua diagnostics_document<CR>", "Find diagnostic in buffer")
        map("n", "<leader>fdw", ":FzfLua diagnostics_workspace<CR>", "Find diagnostic in project")
        map("n", "<leader>fcf", ":FzfLua git_bcommits<CR>", "Find commit in buffer")
        map("n", "<leader>fcw", ":FzfLua git_commits<CR>", "Find commit in project")

        require("fzf-lua").register_ui_select()
    end,
    opts = {
        "borderless",
        winopts = {
            -- [ "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" ]
            border  = { " ", "", " ", " ", "", "", "", " " },
        },
    }
}
