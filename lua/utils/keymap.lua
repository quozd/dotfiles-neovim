local M = {}

function M.map(mode, lhs, rhs, desc, opts)
    opts = opts or { noremap = true, silent = true }
    opts.desc = desc
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
