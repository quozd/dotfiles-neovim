local util = require('lspconfig/util')

local venvPathCached = false
local venvPath = nil

function find_python_virtualenv(workspace)
    if venvPathCached then
        return venvPath
    end

    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        venvPath = vim.env.VIRTUAL_ENV
    end

    local match

    -- Find and use virtualenv in workspace directory.
    match = vim.fn.glob(util.path.join(workspace, ".venv"))
    if match ~= "" then
        venvPath = match
    end

    -- Find and use virtualenv via poetry in workspace directory.
    match = vim.fn.glob(util.path.join(workspace, 'poetry.lock'))
    if match ~= '' then
        local poetryDir = util.path.dirname(match)
        venvPath = vim.fn.trim(vim.fn.system('cd '..poetryDir..' && '..'poetry env info -p'))
    end

    venvPathCached = true
    return venvPath
end
