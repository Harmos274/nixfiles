return function ()
  -- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  local map = require('utils').map

  require('nvim-tree').setup {
    update_cwd = true,
    open_on_tab = true,
    ignore_buffer_on_setup = true,
    update_focused_file = {
      enable = true,
    },
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
