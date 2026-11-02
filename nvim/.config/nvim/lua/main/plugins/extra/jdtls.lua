local spec = { "mfussenegger/nvim-jdtls" }

spec.ft = "java"

spec.opts = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
    root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

spec.config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
            require("jdtls").start_or_attach(opts)
        end,
    })
end

return spec
