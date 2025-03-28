-- trim whitespace on save
vim.cmd [[
    au BufWritePre * :%s/\s\+$//e
]]

vim.cmd [[
    au InsertEnter * :set norelativenumber
    au InsertLeave * :set relativenumber
]]

if vim.fn.argc() == 0 then
    vim.defer_fn(
        function()
            vim.cmd('Neotree source=filesystem position=current')
        end,
        0
    )
end
