local luau_platform = vim.fs.root(0, function(name)
    return name:match(".+%.project%.json$")
end) and "roblox" or "standard"

return {
    server = {
        ignoreGlobs = {
            "*.d.luau",
            "**/luau_packages/**",
            "**/roblox_packages/**",
            "**/lune_packages/**",
            "**/.pesde/**",
            "**/network/**",
            "**/build/**",
        },
        completion = {
            imports = {
                enable = true,
                stringRequires = {
                    enabled = true,
                },
                ignoreGlobs = {
                    "*.d.luau",
                    "**/luau_packages/**",
                    "**/.pesde/**",
                    "**/lune_packages/**",
                },
            },
        },
        fflags = {
            enableNewSolver = false,
        },
    },
    opts = {
        platform = {
            type = luau_platform,
        },
        plugin = {
            enabled = false,
        },
        sourcemap = {
            enabled = (luau_platform == "roblox"),
            autogenerate = true,
        },
        types = {
            definition_files = { "globalTypes.d.luau" },
            documentation_files = { "en-us.json" },
        },
    },
}
