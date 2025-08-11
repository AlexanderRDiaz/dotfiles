local M = {}

function M.fqn(fname)
    fname = vim.fn.fnamemodify(fname, ":p")
    return uv.fs_realpath(fname) or fname
end

function M.exists(fname)
    local stat = vim.uv.fs_stat(fname)
    return (stat and stat.type) or false
end

return M
