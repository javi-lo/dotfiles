return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,              opts)
      vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,             opts)
      vim.keymap.set('n', 'gr',         vim.lsp.buf.references,              opts)
      vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,          opts)
      vim.keymap.set('n', 'K',          vim.lsp.buf.hover,                   opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,                  opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,             opts)
      vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev,            opts)
      vim.keymap.set('n', ']d',         vim.diagnostic.goto_next,            opts)
      vim.keymap.set('n', 'gl',         vim.diagnostic.open_float,           opts)

      if client.name == 'clangd' then
        vim.keymap.set('n', '<leader>o',  '<cmd>ClangdSwitchSourceHeader<cr>', opts)
      end
    end

    -- clangd
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    vim.lsp.enable('clangd')

    -- read .cc files as .cpp files
    vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
      pattern = '*.cc',
      callback = function() vim.bo.filetype = 'cpp' end
    })

    -- cmake language server
    vim.lsp.enable('cmake')

    -- read CMakelists.txt files as cmake files
    vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
      pattern = '[Cc][Mm]ake[Ll]ists.txt',
      callback = function() vim.bo.filetype = 'cmake' end
    })

    -- gopls
    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities, capabilities,
    }

    vim.lsp.enable('gopls')

    -- svelte-language-server
    vim.lsp.enable('svelte')

    -- pyright
    vim.lsp.enable('pyright')

    -- lua language server
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities, capabilities,
    }

    -- lsp for neovim plugins
    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
            path = {
              'lua/?.lua',
              'lua/?/init.lua',
            },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })

    vim.lsp.enable('lua_ls')
  end
}
