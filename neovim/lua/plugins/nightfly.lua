return {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    enabled = false,
    init = function ()
        vim.cmd [[colorscheme nightfly]]
    end,
}
