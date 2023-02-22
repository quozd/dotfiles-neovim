local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvimtree.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    hijack_directories   = {
        enable = true,
        auto_open = true,
    },
    actions = {
        open_file = {
            resize_window = false,
            window_picker = {
                enable = true
            },
        },
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
        hide_root_folder = false,
        side = 'left',
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
    renderer = {
        icons = {
            show = {
                git = false,
                folder = true,
                file = false,
                folder_arrow = false,
                -- tree_width = 60,
            },
            glyphs = {
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
            },
        },
    },
}

vim.keymap.set("n", "<C-N>", ":NvimTreeToggle<CR>", { silent = true, noremap = true, desc = "Toggle file tree"})
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true, noremap = true, desc = "Find file in tree"})
