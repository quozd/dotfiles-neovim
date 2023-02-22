local opts = { noremap = true, silent = true }

-- Leader ','
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Normal --
-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Remove search highlight on Enter
vim.keymap.set("n", "<CR>", ":nohlsearch<CR><CR>", opts)

-- Switch between relative and nonrelative line numbers
vim.keymap.set("n", "<leader>u", ':exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>', { noremap = true, silent = true, desc = "Toggle relative numbers"})

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Copy current buffer to a separate tab
vim.keymap.set("n", "<leader>z", ":tab split<CR>", { noremap = true, silent = true, desc = "Buffer to tab"})
vim.keymap.set("n", "<leader>Z", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close tab"})
