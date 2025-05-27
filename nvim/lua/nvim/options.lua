vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.mouse = ""

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { desc = 'Move focus to the upper window' })

vim.opt.scrolloff = 4
vim.opt.signcolumn = yes
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- read .cc files as .cpp files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.cc",
  callback = function()
    vim.bo.filetype = "cpp"
  end
})

