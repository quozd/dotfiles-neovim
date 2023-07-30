local function map(mode, lhs, rhs, desc, opts)
    opts = opts or { noremap = true, silent = true }
    opts.desc = desc
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal --
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
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Previous buffer")

-- Remove search highlight on Enter
map("n", "<CR>", ":nohlsearch<CR><CR>", "Remove search highlights")

-- Switch between relative and nonrelative line numbers
map("n", "<leader>u", ':exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>',
    "Toggle relative numbers")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", "Decrease indentation")
map("v", ">", ">gv", "Increase indentation")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move line up")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move line down")

-- Neotree
map("n", "<C-n>", ":Neotree toggle<CR>", "Toggle file tree")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", "Find file")
map("n", "<leader>fg", ":Telescope live_grep<CR>", "Find in files (grep)")
