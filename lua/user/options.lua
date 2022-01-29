vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.autoread = true -- reread files automatically
vim.opt.backspace = {"indent", "eol", "start"} -- sane backspace behaviour
vim.opt.backup = false -- don't keep backups
--vim.opt.clipboard = "unnamedplus" -- system clipboard
vim.opt.colorcolumn = "120" -- highlight 120 column
vim.opt.completeopt = {"menu", "menuone", "noselect", "preview"} -- show compeltion popup even with 1 item, don't autoselect
vim.opt.cursorline = true -- highlight cursor line
vim.opt.errorbells = false -- disable error bell
vim.opt.expandtab = true -- replace tabs with spaces
vim.opt.fileencoding = "utf-8" -- file encoding
vim.opt.foldlevel = 10 -- close folds level 10+
vim.opt.foldmethod = "indent" -- fold on indent
vim.opt.hidden = true -- don't unload hidded buffers
vim.opt.history = 1000 -- long commands history
vim.opt.hlsearch = true -- highlight all search results
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.incsearch = true -- show search results immideately
vim.opt.laststatus = 2 -- always show status line
vim.opt.listchars:append({ trail = "·" }) -- display trailing spaces
vim.opt.mouse = "a" -- enable mouse
vim.opt.number = true -- show line numbers
vim.opt.numberwidth = 4 -- width of number columns
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.ruler = true -- show cursor position
vim.opt.scrolloff = 8 -- show more lines around the current line
vim.opt.shiftwidth = 4 -- indent size
vim.opt.showmatch = true -- quickly show matching bracket
vim.opt.showmode = true -- always show current mode
vim.opt.showtabline = 1 -- show tabs line only if at least 2 tabs
vim.opt.sidescrolloff = 8 -- show more chars around the cursor
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.smartcase = true -- override ignorecase if upper case chars present in the pattern
vim.opt.smartindent = true -- enable smart indentation
vim.opt.smarttab = true -- smart tabbing
vim.opt.softtabstop = 4
vim.opt.splitbelow = true -- always split below
vim.opt.splitright = true -- always split right
vim.opt.swapfile = false -- disable swap files
vim.opt.tabstop = 4
vim.opt.termguicolors = true -- 24-bits RGB colors
vim.opt.updatetime = 300 -- write to disk more often
vim.opt.visualbell = false -- disable visual bell
vim.opt.wrap = false -- don't wrap text
vim.opt.writebackup = true -- backup before save
