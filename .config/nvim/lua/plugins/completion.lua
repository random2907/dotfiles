return {
        "hrsh7th/nvim-cmp",
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "L3MON4D3/LuaSnip"
        },
        config = function()
                local cmp = require 'cmp'
                cmp.setup({
                        preselect = cmp.PreselectMode.None,
                        completion = { completeopt = "menu,menuone,noselect" },
                        snippet = {
                                expand = function(args)
                                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                                end,
                        },
                        mapping = cmp.mapping.preset.insert({
                                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                                ["<C-Space>"] = cmp.mapping.complete(),
                        }),
                        sources = cmp.config.sources({
                                { name = 'nvim_lsp' },
                                { name = 'luasnip' }, -- For luasnip users.
                        }, {
                                { name = 'buffer' },
                        })
                })
        end
}
