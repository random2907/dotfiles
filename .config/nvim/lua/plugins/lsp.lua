return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "mbbill/undotree",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                {
                        'nvim-flutter/flutter-tools.nvim',
                        lazy = false,
                        dependencies = {
                                'nvim-lua/plenary.nvim',
                        },
                        config = true,
                },
                "neovim/nvim-lspconfig",
                "NvChad/nvim-colorizer.lua"
        },
        config = function()
                require("colorizer").setup()
                require("mason").setup()
                require("mason-lspconfig").setup()
        end,
}
