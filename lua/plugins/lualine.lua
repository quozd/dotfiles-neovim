return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = false,
            component_separators = "",
            section_separators = "",
            globalstatus = true,
            disabled_filetypes = {
                winbar = { 'aerial', 'neo-tree', 'Avante', 'AvanteSelectedFiles', 'AvanteInput' },
            },
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {{'tabs', mode = 0}},
            lualine_c = {{'filename', path = 3}},
            lualine_x = {'branch', 'diff', 'diagnostics'},
            lualine_y = {'encoding', 'fileformat', 'filetype'},
            lualine_z = {'location'},
        },
        winbar = {
            lualine_c = {{'filename', path = 3}},
        },
        inactive_winbar = {
            lualine_c = {{'filename', path = 3}},
        },
        extensions = {"quickfix", "neo-tree", "trouble", "nvim-dap-ui", "aerial"}
    },
}
