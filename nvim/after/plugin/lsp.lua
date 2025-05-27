local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  cmp_nvim_lsp.default_capabilities()
)

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,     opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,    opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references,     opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover,          opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,       opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,  opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,         opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next,         opts)
end

-- clangd
lspconfig.clangd.setup {
  on_attach   = on_attach,
  capabilities = capabilities,
}

vim.lsp.enable('clangd')
