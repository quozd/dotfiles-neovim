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
    opts = {
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
                    staged = "",
                    conflict = "!",
                },
            },
        },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
        },
        window = {
            mappings = {
                ["o"] = "open",
            },
        },
        renderers = {
            directory = {
                { "indent" },
                { "current_filter" },
                {
                    "container",
                    content = {
                        { "name", zindex = 10 },
                        { "clipboard", zindex = 10 },
                        { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                        { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
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
                    },
                },

            },
        },

    },
}
