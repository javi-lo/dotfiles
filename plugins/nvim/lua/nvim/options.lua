vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = ''
vim.opt.virtualedit = 'block'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = yes
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.g.lsp_diagnostics_enabled = 1
vim.g.lsp_diagnostics_echo_cursor = 1

vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
