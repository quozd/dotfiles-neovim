return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    init = function()
        local map = require("utils.keymap").map
        map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", "Undo stage hunk")
    end,
    opts = {
        signs = {
            -- add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
            -- change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            -- delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            -- topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
            -- changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            -- untracked    = {hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 500,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    },
}
