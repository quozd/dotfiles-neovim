return {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        style = "moon",
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            functions = {},
            variables = {},
        },
    },
    config = function(_, opts)
		require("tokyonight").setup(opts)
        vim.cmd.colorscheme("tokyonight-moon")
	end,
}
