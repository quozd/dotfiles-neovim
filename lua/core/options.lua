vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.syntax = "on"
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.autoread = true -- reread files automatically
vim.opt.autowrite = true -- Enable auto write
vim.opt.backspace = { "indent", "eol", "start" } -- sane backspace behaviour
vim.opt.backup = false -- don't keep backups
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.colorcolumn = "120" -- highlight 120 column
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "preview" } -- show compeltion popup even with 1 item, don't autoselect
vim.opt.copyindent = true -- copy the previous indentation on autoindenting
vim.opt.cursorline = true -- highlight cursor line
vim.opt.diffopt:append "linematch:60" -- enable linematch diff algorithm
vim.opt.errorbells = false -- disable error bell
vim.opt.expandtab = true -- replace tabs with spaces
vim.opt.fileencoding = "utf-8" -- file encoding
vim.opt.foldcolumn = "0" -- show foldcolumn
vim.opt.foldenable = true -- enable fold for nvim-ufo
vim.opt.foldlevel = 10 -- close folds level 10+
vim.opt.foldmethod = "indent" -- fold on indent
vim.opt.hidden = true -- don't unload hidded buffers
vim.opt.history = 1000 -- long commands history
vim.opt.hlsearch = true -- highlight all search results
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.incsearch = true -- show search results immideately
vim.opt.infercase = true -- infer cases in keyword completion
vim.opt.laststatus = 3 -- global statusline
vim.opt.list = true
vim.opt.listchars:append({ trail = "·" }) -- display trailing spaces
vim.opt.mouse = "a" -- enable mouse
vim.opt.number = true -- show line numbers
vim.opt.numberwidth = 4 -- width of number columns
vim.opt.pumheight = 10 -- height of the pop up menu
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.ruler = true -- show cursor position
vim.opt.scrolloff = 8 -- show more lines around the current line
vim.opt.shiftwidth = 4 -- indent size
vim.opt.showmatch = true -- quickly show matching bracket
vim.opt.showmode = false -- disable showing modes in command line
vim.opt.showtabline = 0 -- show tabs line only if at least 2 tabs
vim.opt.sidescrolloff = 8 -- show more chars around the cursor
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.smartcase = true -- override ignorecase if upper case chars present in the pattern
vim.opt.smarttab = true -- smart tabbing
vim.opt.softtabstop = 4
vim.opt.splitbelow = true -- always split below
vim.opt.splitright = true -- always split right
vim.opt.swapfile = false -- disable swap files
vim.opt.tabstop = 4 -- number of space in a tab
vim.opt.termguicolors = true -- 24-bits RGB colors
vim.opt.timeoutlen = 500 -- shorten key timeout length a little bit for which-key
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- write to disk more often
vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode
vim.opt.visualbell = false -- disable visual bell
vim.opt.wrap = false -- don't wrap text
vim.opt.writebackup = true -- backup before save
