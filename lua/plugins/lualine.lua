return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = false,
            component_separators = "",
            section_separators = "",
            globalstatus = true,
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'tabs'},
            lualine_c = {{'filename', path = 3}},
            lualine_x = {'branch', 'diff', 'diagnostics'},
            lualine_y = {'encoding', 'fileformat', 'filetype'},
            lualine_z = {'location'},
        },
        extensions = {"quickfix", "neo-tree", "trouble", "nvim-dap-ui", "aerial"}
    },
}
