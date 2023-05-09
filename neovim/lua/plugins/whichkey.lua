return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")
        local nvimTreeApi = require("nvim-tree.api")
        wk.setup({
            plugins = {
                presets = {
                    operators = true
                }
            }
        })
        local mappings = {
            ["<leader>t"] = { nvimTreeApi.tree.toggle, "Toggle file explorer" },
            {
                name = "Language Server",
                ["<leader>f"] = { vim.lsp.buf.format, "Format buffer" },
                ["<leader>gd"] = { vim.lsp.buf.definition, "Go to declaration" },
                ["<leader>gD"] = { vim.lsp.buf.definition, "Go to definition" },
                ["<leader>k"] = { vim.lsp.buf.hover, "Hover" }
            },
            ["<leader>lg"] = { "<cmd>LazyGit<cr>", "Open LazyGit" },
        }
        wk.register(mappings)
    end,
    dependencies = { { "nvim-tree/nvim-tree.lua" } }
}
