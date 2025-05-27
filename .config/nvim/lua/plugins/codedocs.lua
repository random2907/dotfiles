return {
        {
                "jeangiraldoo/codedocs.nvim",
                -- Remove the 'dependencies' section if you don't plan on using nvim-treesitter
                dependencies = {
                        "nvim-treesitter/nvim-treesitter"
                },
        config = function()
                vim.keymap.set(
                        "n", "<leader>k", require('codedocs').insert_docs,
                        { desc = "Insert docstring" }
                )
        end
        }
}
