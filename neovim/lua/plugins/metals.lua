-- https://github.com/scalameta/nvim-metals
return {
    'scalameta/nvim-metals',
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "mfussenegger/nvim-dap" }
    },
    config = function()
        local metals_config = require("metals").bare_config()

        metals_config.settings = {
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        }

        metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Debug settings if you're using nvim-dap
        -- Autocmd that will actually be in charging of starting the whole thing
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            -- NOTE: You may or may not want java included here. You will need it if you
            -- want basic Java support but it may also conflict if you are using
            -- something like nvim-jdtls which also works on a java filetype autocmd.
            pattern = { "scala", "sbt", "java", "worksheet.sc", "sc" },
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })

        metals_config.on_attach = function(client, bufnr)
            require("metals").setup_dap()
        end
    end,
}
