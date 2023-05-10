-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
                               -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' }, -- Required
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/vim-vsnip' },
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' }, -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.preset({
            name = 'minimal',
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = true,
        })
        lsp.nvim_workspace()
        lsp.setup()

        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "vsnip" },
            },
            snippet = {
                expand = function(args)
                    -- Comes from vsnip
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- None of this made sense to me when first looking into this since there
                -- is no vim docs, but you can't have select = true here _unless_ you are
                -- also using the snippet stuff. So keep in mind that if you remove
                -- snippets you need to remove this select
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- I use tabs... some say you should stick to ins-completion but this is just here as an example
                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ["<S-Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
            }),
        })
    end,
}
