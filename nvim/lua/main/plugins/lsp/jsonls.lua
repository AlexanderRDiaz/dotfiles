local extra = {
    {
        description = "Rojo project schema",
        fileMatch = { "*.project.json" },
        name = "project.json",
        url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
    },
    {
        description = "Lua reconfiguration schema",
        fileMatch = { ".luarc.json", ".luarc.jsonc" },
        name = "luarc.json",
        url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
    },
}

return {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas({
                extra = extra,
            }),
            validate = { enable = true },
            format = { enable = true },
        },
    },
}
