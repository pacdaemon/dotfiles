-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true
            },
        })
    end,
}
