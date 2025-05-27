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
    ['<tab>']  = cmp.mapping.confirm({ select = true }),
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
