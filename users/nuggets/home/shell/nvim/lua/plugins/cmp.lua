return function ()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Esc>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
    },

    formatting = {
      format = lspkind.cmp_format(),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
    experimental = {
      ghost_text = true,
    }
  }

  vim.opt.completeopt = { 'menuone', 'noselect' }
  -- Remove cmp status display
  vim.opt.shortmess:append('c')
end
