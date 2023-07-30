return {
    "nvim-telescope/telescope.nvim",
    opts = function()
        actions = require("telescope.actions")
        return {
            defaults = {
                border = false,
                borderchars = {"", "", "", "", "", "", "", ""},
                color_devicons = false,
                layout_strategy = "bottom_pane",
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
        }
    end,
}
