return {
    "pwntester/octo.nvim",
    config = function()
        require("octo").setup()
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "kyazdani42/nvim-web-devicons" }
    }
}
