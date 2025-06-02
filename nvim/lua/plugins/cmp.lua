return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- LSP source
    "hrsh7th/cmp-buffer",        -- buffer words
    "hrsh7th/cmp-path",          -- filesystem paths
    "hrsh7th/cmp-cmdline",       -- vim command-line
    "L3MON4D3/LuaSnip",          -- snippet engine
    "saadparwaiz1/cmp_luasnip",  -- snippet completions
  },
  config = function()
    vim.o.completeopt = 'menuone,noselect'

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>']  = cmp.mapping.confirm({ select = true }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip'  },
        { name = 'buffer'   },
        { name = 'path'     },
      },
      -- **Auto-trigger** as you type:
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
      },
    })
  end
}
