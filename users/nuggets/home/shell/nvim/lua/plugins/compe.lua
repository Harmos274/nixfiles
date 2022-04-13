return function ()
  require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = false,
    },
  }

  local map = require('utils').map
  local options = { expr = true }

  map('i', '<C-Space>', 'compe#complete()',                   options)
  map('i', '<Esc>',     'compe#close("<Esc>")',               options)
  map('i', '<CR>',      'compe#confirm("<CR>")',              options)
  map('i', '<C-j>',     'pumvisible() ? "<C-n>" : "<Tab>"',   options)
  map('i', '<C-k>',     'pumvisible() ? "<C-p>" : "<S-Tab>"', options)

  vim.opt.completeopt = { 'menuone', 'noselect' }
  -- Remove compe status display
  vim.opt.shortmess:append('c')
end
