vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'View project files' })

vim.keymap.set('n', '[t', vim.cmd.tabnext, { desc = 'Previous tab' })
vim.keymap.set('n', ']t', vim.cmd.tabnext, { desc = 'Next tab' })

vim.keymap.set('n', '<leader>co', vim.cmd.copen, { desc = 'Open quickfix menu' })
vim.keymap.set('n', '<leader>cc', vim.cmd.cclose, { desc = 'Close quickfix menu' })

vim.keymap.set('n', '<esc>', '<cmd>noh<cr>')
