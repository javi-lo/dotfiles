vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'View project files' })

vim.keymap.set('n', '<leader>t', vim.cmd.Texplore, { desc = "Open a new tab in current file's dir" })
vim.keymap.set('n', '<leader>T', vim.cmd.tabnew, { desc = 'Open a new tab' })

vim.keymap.set('n', '[t', vim.cmd.tabprev, { desc = 'Previous tab' })
vim.keymap.set('n', ']t', vim.cmd.tabnext, { desc = 'Next tab' })

vim.keymap.set('n', '[<leader>', '<cmd>tabmove -1<cr>', { desc = 'Move tab left' })
vim.keymap.set('n', ']<leader>', '<cmd>tabmove +1<cr>', { desc = 'Move tab right' })

vim.keymap.set('n', '<leader>co', vim.cmd.copen, { desc = 'Open quickfix menu' })
vim.keymap.set('n', '<leader>cc', vim.cmd.cclose, { desc = 'Close quickfix menu' })

vim.keymap.set('n', '<c-j>', vim.cmd.cnext, { desc = 'Next quickfix menu item' })
vim.keymap.set('n', '<c-k>', vim.cmd.cprev, { desc = 'Previous quickfix menu item' })

vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { desc = 'Clear highlighted text after search' })
