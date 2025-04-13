return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        -- add any opts here
        -- for example
        provider = "copilot",
        openai = {
            endpoint = "https://api.openai.com/v1",
            model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
            timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
        auto_suggestions_provider = "openai",
        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
            enable_token_counting = true, -- Whether to enable token counting. Default to true.
            enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
            enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
        },
        windows = {
            sidebar_header = {
                enabled = true,
                align = "left",
                rounded = false,
            },
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
