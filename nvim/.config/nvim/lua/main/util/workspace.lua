local fs = require("main.util.fs")

local M = {
}

local ts_files = {
    "tsconfig.json",
    "eslint.config.ts",
    "estlint.config.ts",
    ".prettierrc",
}

function M.usesTS()
    for _, file in ipairs(ts_files) do
        if fs.exists(file) then
            return true
        end
    end

    return false
end

return M 
