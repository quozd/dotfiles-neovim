local map = require("utils.keymap").map

-- Navigate windows
map("n", "<C-h>", "<C-w>h", "Go to the window the left")
map("n", "<C-j>", "<C-w>j", "Go to the window above")
map("n", "<C-k>", "<C-w>k", "Go to the window below")
map("n", "<C-l>", "<C-w>l", "Go to the window to the right")
map("n", "<leader>z", ":tab split<CR>", "Split the current buffer to a tab")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", "Increase window height")
map("n", "<C-Down>", ":resize -2<CR>", "Decrease window height")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease window width")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Increase window width")

-- Navigate buffers
map("n", "<S-l>", ":tabnext<CR>", "Next tab")
map("n", "<S-h>", ":tabprevious<CR>", "Previous tab")

-- Remove search highlight on Enter
map("n", "<CR>", ":nohlsearch<CR><CR>", "Remove search highlights")

-- Switch between relative and nonrelative line numbers
map("n", "<leader>u", ':exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>',
    "Toggle relative numbers")

-- Stay in indent mode
map("v", "<", "<gv", "Decrease indentation")
map("v", ">", ">gv", "Increase indentation")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move line up")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move line down")

