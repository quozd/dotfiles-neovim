local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader ','
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Navigate windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Remove search highlight on Enter
keymap("n", "<CR>", ":nohlsearch<CR><CR>", opts)

-- Switch between relative and nonrelative line numbers
keymap("n", "<leader>u", ':exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better ESC in terminal
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- " Nerd tree
-- keymap("n", "<C-n>", ":NERDTreeToggle<CR>", opts)
-- keymap("n", "<leader>f", ":NERDTreeFind<CR>", opts)

-- Nvim tree
keymap("n", "<C-N>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

