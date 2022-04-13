return function ()
  -- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  local map = require('utils').map

  require('nvim-tree').setup {
    open_on_setup = true,
    ignore_ft_on_setup = {},
    --auto_close = true,
    update_cwd = true,

    update_to_buf_dir = {
      -- enable the feature
      enable = true,
      -- allow to open the tree if it was previously closed
      auto_open = true,
    },

    diagnostics = {
      enable = true,
      icons = {
        hint = "❓",
        info = "🔎",
        warning = "😠",
        error = "🥲",
      }
    },

    update_focused_file = {
      -- enables the feature
      enable      = false,
      -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
      -- only relevant when `update_focused_file.enable` is true
      update_cwd  = false,
      -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
      -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
      ignore_list = {}
    },
    view = {
      -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
      width = "20%",
      -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
      height = 100,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
      -- if true the tree will resize itself after opening a file
      auto_resize = true,
      mappings = {
        -- custom only false will merge the list with the default mappings
        -- if true, it will only use your list to set the mappings
        custom_only = false,
        -- list of mappings to set on the tree manually
        list = {
            { key = "<C-k>",                        action = "" },
            { key = "<M-k>",                        action = "toggle_file_info" },
        }
    }
  },
}
  map('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>')
end
