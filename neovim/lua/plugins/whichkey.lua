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
        local telescope = require("telescope.builtin")
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
                ["K"] = { vim.lsp.buf.hover, "Hover" },
                ["<space>clr"] = { vim.lsp.codelens.refresh, "Code lens refresh" },
            },
            ["<space>gl"] = { "<cmd>LazyGit<cr>", "Open LazyGit" },
            ["<space>ff"] = { telescope.find_files, "Find files" },
            ["<space>fg"] = { telescope.live_grep, "Live grep" },
        }
        wk.register(mappings)
    end,
    dependencies = { { "nvim-tree/nvim-tree.lua" }, { "simrat39/rust-tools.nvim" } }
}
