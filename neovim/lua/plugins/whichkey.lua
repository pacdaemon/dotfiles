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
                ["<space>f"] = { vim.lsp.buf.format, "Format buffer" },
                ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
                ["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
                ["gr"] = { vim.lsp.buf.references, "References" },
                ["gi"] = { vim.lsp.buf.implementation, "Implementation" },
                ["<space>rn"] = { vim.lsp.buf.rename, "Rename" },
                ["<space>ca"] = { vim.lsp.buf.code_action, "Code action" },
                ["<space>cl"] = { vim.lsp.codelens.run, "Code lens" },
                ["K"] = { vim.lsp.buf.hover, "Hover" }
            },
            ["<leader>gl"] = { "<cmd>LazyGit<cr>", "Open LazyGit" },
        }
        wk.register(mappings)
    end,
    dependencies = { { "nvim-tree/nvim-tree.lua" } }
}
