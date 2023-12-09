return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
        -- show_current_context = true,
        -- use_treesitter = true,
        indent = {
            char = "▏",
            tab_char = "▏",
        },
        scope = {
            show_start = false,
            show_end = false,
        }
    },
}
