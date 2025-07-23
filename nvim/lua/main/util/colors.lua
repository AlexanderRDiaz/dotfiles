local M = {}

local require_palette_paths = {
    catppuccin = "catppuccin.palettes",
    tokyonight = "tokyonight.colors",
}

function M.get_palette()
    local theme = vim.g.colors_name
    local flavour

    if string.match(theme, "^catppuccin") then
        local arr = vim.split(theme, "-")
        theme = arr[1]
        flavour = arr[2]
    end

    local palette = require(
        require_palette_paths[theme]
        or error(string.format("Palette path not created for %s", theme))
    )

    if theme == "catppuccin" then
        palette = palette.get_palette(flavour)
    else
        palette = palette.setup()
    end

    return palette
end

return M
