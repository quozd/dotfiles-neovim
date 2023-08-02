-- trim whitespace on save
vim.cmd [[
    au BufWritePre * :%s/\s\+$//e
]]

vim.cmd [[
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
]]

vim.cmd [[
    au VimEnter * :Telescope find_files
]]
