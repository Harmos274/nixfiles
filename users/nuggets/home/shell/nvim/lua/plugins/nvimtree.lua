return function ()
  -- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  local map = require('utils').map

  require('nvim-tree').setup {
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "❓",
        info = "🔎",
        warning = "😠",
        error = "🥲",
      }
    },
    view = {
      width = "20%",
      side = 'left',
      preserve_window_proportions = true,
      mappings = {
        custom_only = false,
        list = {
            { key = "<C-k>", action = "" },
            { key = "<M-k>", action = "toggle_file_info" },
        }
      }
    },
  }
  map('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>')
end
