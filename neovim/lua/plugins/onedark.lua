return {
    'navarasu/onedark.nvim',
    enabled = false,
    init = function()
        require('onedark').setup {
            style = 'warmer'
        }
        require('onedark').load()
    end,
}
