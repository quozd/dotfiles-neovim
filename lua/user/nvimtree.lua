vim.g.nvim_tree_disable_window_picker = 1

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 0,
    folder_arrows = 0,
    tree_width = 60,
}

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "*",
    git = {
        unstaged = "u",
        staged = "S",
        unmerged = "um",
        renamed = "➜",
        deleted = "d",
        untracked = "U",
        ignored = "i",
    },
    folder = {
        default = "▸",
        open = "▾",
        -- default = " ",
        -- open = " ",
        empty = "▫",
        empty_open = "▫",
        symlink = "*",
    },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "h",
            info = "i",
            warning = "w",
            error = "e",
        }
    },
    update_focused_file = {
        enable      = true,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = false,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 40,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
}
