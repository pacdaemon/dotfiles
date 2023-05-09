return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		local nvimTreeApi = require("nvim-tree.api")
		wk.setup({
			filter = {
				dotfiles = true
			},
		})
		local mappings = {
			["<leader>t"] = { nvimTreeApi.tree.toggle, "Toggle file explorer" },
			["<leader>f"] = { vim.lsp.buf.format, "Format buffer" }
		}
		wk.register(mappings)
	end,
	dependencies = { { "nvim-tree/nvim-tree.lua" } }
}
