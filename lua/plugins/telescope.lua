return {
    "nvim-telescope/telescope.nvim",
    -- dependencies = {
    --     "nvim-telescope/telescope-ui-select.nvim",
    -- },
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
            -- extensions = {
            --     ["ui-select"] = {
            --         require("telescope.themes").get_dropdown {}
            --     },
            -- },
        }
    end,
}
