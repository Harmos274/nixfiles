return function ()
  -- vim.g.vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

  local map = require("utils").map
  local options = { expr = true, noremap = false }

  map('i', '<C-l>', 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
  map('s', '<C-l>', 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
  map('i', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)
  map('s', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)
end
