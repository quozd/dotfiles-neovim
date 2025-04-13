return {
    "sindrets/diffview.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    init = function()
        local map = require("utils.keymap").map
        map("n", "<leader>gd", ":DiffviewOpen<CR>", "Open Diffview")
        map("n", "<leader>gH", ":DiffviewFileHistory %<CR>", "Open Diffview file commits history")
        -- map("n", "<leader>gH", ":DiffviewFileHistory<CR>", "Open Diffview commits history")
    end,
    opts = function(_, opts)
        local actions = require("diffview.actions")
        return {
            enhanced_diff_hl = true,
            use_icons = false,
            signs = {
                fold_closed = "+ ",
                fold_open = "- ",
                done = "OK",
            },
            view = {
                merge_tool = {
                    layout = "diff4_mixed",
                }
            },
            file_panel = {
                win_config = {
                    width = 50,
                },
            },
            keymaps = {
                file_panel = {
                    { "n", "q", ":DiffviewClose<CR>", { desc = "Close Diffview" } },
                    { "n", "e", actions.goto_file_edit, { desc = "Open the file in the previous tabpage" } },
                },
                file_history_panel = {
                    { "n", "q", ":DiffviewClose<CR>", { desc = "Close Diffview" } },
                },
            },
        }
    end,
}
