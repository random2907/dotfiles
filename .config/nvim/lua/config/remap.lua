vim.g.mapleader = " "
vim.keymap.set('n', '<leader>f', "<cmd>Ex<cr>")
vim.keymap.set('n', '<leader>qf', "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>=G', "<cmd>lua vim.lsp.buf.format()<cr>")
vim.keymap.set('v', '<leader>==', "<cmd>lua vim.lsp.buf.format()<cr>")

