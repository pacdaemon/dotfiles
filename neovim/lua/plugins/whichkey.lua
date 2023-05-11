return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")
        wk.setup({
            plugins = {
                presets = {
                    operators = true
                }
            }
        })
        local mappings = {
            ["<leader>t"] = { '<cmd>NvimTreeToggle<cr>', "Toggle file explorer" },
            {
                name = "Language Server",
                ["<space>f"] = { '<cmd>lua vim.lsp.buf.format()<cr>', "Format buffer" },
                ["gd"] = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go to definition" },
                ["gD"] = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go to declaration" },
                ["gr"] = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
                ["gi"] = { '<cmd>lua vim.lsp.buf.implementation()<cr>', "Implementation" },
                ["<space>rn"] = { '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename" },
                ["<space>ca"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', "Code action" },
                ["<space>cl"] = { '<cmd>lua vim.lsp.codelens.run()<cr>', "Code lens" },
                ["K"] = { '<cmd>lua vim.lsp.buf.hover()<cr>', "Hover" },
                ["<space>clr"] = { '<cmd>lua vim.lsp.codelens.refresh()<cr>', "Code lens refresh" },
                ["<space>aa"] = { '<cmd>lua vim.diagnostic.setqflist()<cr>', "Show all code diagnostics" },
                ["<space>oi"] = { '<cmd>MetalsOrganizeImports<cr>', "Organize imports" }
            },
            {
                name = "Debugger",
                ["<space>dt"] = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', "Toggle breakpoint" },
                ["<space>dc"] = { '<cmd>lua require("dap").continue()<cr>', "Continue" },
                ["<space>dr"] = { '<cmd>lua require("dap").repl.toggle()<cr>', "Toggle debug repl" },
                ["<space>dsi"] = { '<cmd>lua require("dap").step_into()<cr>', "Debug step into" },
                ["<space>dso"] = { '<cmd>lua require("dap").step_over()<cr>', "Debug step over" },
                ["<space>dw"] = { '<cmd>lua require("dap.ui.widgets").hover()<cr>', "Debug widgets" },
            },
            ["<leader>g"] = { "<cmd>LazyGit<cr>", "Open LazyGit" },
            ["<space>ff"] = { '<cmd>lua require("telescope.builtin").find_files()<cr>', "Find files" },
            ["<space>fg"] = { '<cmd>lua require("telescope.builtin").live_grep()<cr>', "Live grep" },
            {
                name = "Telescope",
                ["<space>t"] = { "<cmd>Telescope<cr> ", "Open telescope" },
                ["<space>tc"] = { "<cmd>Telescope commands<cr> ", "Open telescope" },
            },

        }
        wk.register(mappings)
    end,
 }
