return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Apply capabilities to all servers
    vim.lsp.config('*', { capabilities = capabilities })

    -- lsp for neovim plugins
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        }
      }
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local opts = { buffer = ev.buf, silent = true }

        -- Common keymaps for all LSPs
        vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,      opts)
        vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,     opts)
        vim.keymap.set('n', 'gr',         vim.lsp.buf.references,      opts)
        vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,  opts)
        vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,          opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,     opts)
        vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev,    opts)
        vim.keymap.set('n', ']d',         vim.diagnostic.goto_next,    opts)
        vim.keymap.set('n', 'gl',         vim.diagnostic.open_float,   opts)

        -- Clangd-specific keymaps
        if client.name == 'clangd' then
          vim.keymap.set('n', '<leader>o', '<cmd>ClangdSwitchSourceHeader<cr>', opts)
          vim.keymap.set('n', '<leader>O', '<cmd>tab split | ClangdSwitchSourceHeader<cr>', opts)
        end
      end,
    })
  end
}
