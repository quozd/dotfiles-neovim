--" trim whitespace on save
--au BufWritePre * :%s/\s\+$//e


vim.cmd [[
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
]]
