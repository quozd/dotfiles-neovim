return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    cmd = "Neotree",
    lazy = false,
    init = function()
        local map = require("utils.keymap").map
        map("n", "<leader>bf", ":Neotree source=filesystem toggle=true reveal=true position=left<CR>", "Browse files tree")
        map("n", "<leader>bb", ":Neotree source=buffers toggle=true reveal=true position=left<CR>", "Browse buffers tree")
        map("n", "<leader>bs", ":Neotree source=document_symbols toggle=true reveal=true position=left<CR>", "Browse symbos tree")
        map("n", "<leader>bg", ":Neotree source=git_status toggle=true reveal=true position=left<CR>", "Browse git changes tree")
    end,
    opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        use_popups_for_input = false,
        close_if_last_window = true,
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1,
            },
            name = {
                trailing_slash = true,
            },
            modified = { symbol = "*" },
            git_status = {
                symbols = {
                    added = "A",
                    deleted = "D",
                    modified = "M",
                    renamed = "R",
                    untracked = "U",
                    ignored = "I",
                    unstaged = "",
                    staged = ".",
                    conflict = "!",
                },
            },
        },
        filesystem = {
            follow_current_file = { enabled = true, leave_dirs_open = true },
            filtered_items = {
                always_show_by_pattern = {
                    ".env*",
                    "*.env",
                },
                always_show = {
                    ".gitignore",
                    ".dockerignore",
                },
            },
            hijack_netrw_behavior = "open_current",
        },
        document_symbols = {
            -- follow_cursor = true,
            renderers = {
                root = {
                    {"indent"},
                    {"icon", default="C" },
                    {"name", zindex = 10},
                },
                symbol = {
                    {
                        "indent", with_expanders = true,
                        expander_collapsed = "+",
                        expander_expanded = "-",
                    },
                    {"container",
                    content = {
                        {"name", zindex = 10},
                        {"kind_name", zindex = 20, align = "right"},
                    }
                }
                },
            },
        },
        window = {
            width = 50,
            mappings = {
                ["l"] = "open",
                ["h"] = "close_node",
                ["L"] = "toggle_node",
                ["Y"] = {
                    function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        vim.fn.setreg("+", path, "c")
                    end,
                    desc = "Copy Path to Clipboard",
                },
                ["O"] = {
                    function(state)
                        require("lazy.util").open(state.tree:get_node().path, { system = true })
                    end,
                    desc = "Open with System Application",
                },
                ["P"] = { "toggle_preview", config = { use_float = false } },
            },
        },
        renderers = {
            directory = {
                { "indent", with_expanders = true, expander_collapsed = "+", expander_expanded = "-" },
                { "current_filter" },
                {
                    "container",
                    content = {
                        { "name", zindex = 10 },
                        { "clipboard", zindex = 10 },
                        { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                        { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
                        { "file_size", zindex = 10, align = "right" },
                        { "type", zindex = 10, align = "right" },
                        { "last_modified", zindex = 10, align = "right" },
                        { "created", zindex = 10, align = "right" },
                    },
                },
            },
            file = {
                { "indent" },
                {
                    "container",
                    content = {
                        { "name", zindex = 10 },
                        { "clipboard", zindex = 10 },
                        { "bufnr", zindex = 10 },
                        { "modified", zindex = 20, align = "right" },
                        { "diagnostics", zindex = 20, align = "right" },
                        { "git_status", zindex = 20, align = "right" },
                        { "file_size", zindex = 10, align = "right" },
                        { "type", zindex = 10, align = "right" },
                        { "last_modified", zindex = 10, align = "right" },
                        { "created", zindex = 10, align = "right" },
                    },
                },

            },
        },

    },
}
