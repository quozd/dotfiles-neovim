return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua",
    },
    init = function()
        local map = require("utils.keymap").map
        map("n", "<leader>gs", ":Neogit<CR>", "Open Neogit")
        map("n", "<leader>gl", ":Neogit log<CR>", "Open Neogit log")
    end,
    config = true,
    opts = {
        mappings = {
            popup = {
                ["L"] = "LogPopup",
            },
            status = {
                ["l"] = "Toggle",
            },
        },
    },
}
