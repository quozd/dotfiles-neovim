return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function()
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

        return {
            pre_hoook = pre_hook,
        }
    end,
}
