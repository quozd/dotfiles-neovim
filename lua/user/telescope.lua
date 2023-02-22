local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
    return
end

telescope.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- border = false,
        prompt_prefix = "",
        -- preview = false,
        color_devicons = false,
        layout_config = {
            horizontal = {
                width = 0.9,
                -- preview_width = 0.5,
            },
            -- other layout configuration here
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
    pickers = {
        find_files = {
            -- theme = "ivy",
        },
        live_grep = {
            -- theme = "ivy",
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    }
}

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true, noremap = true, desc = 'Find file'})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true, noremap = true, desc = 'Find in files'})
