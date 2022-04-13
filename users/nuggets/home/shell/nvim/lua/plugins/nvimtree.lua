return function ()
  -- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  local map = require('utils').map

  require('nvim-tree').setup {
    open_on_setup = true,
    update_cwd = true,

    diagnostics = {
      enable = true,
      shows_on_dir = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
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
          { key = "<C-k>", action = "" },
          { key = "<M-k>", action = "toggle_file_info" },
        }
    }
  },
}
  map('n', '<C-k><C-b>', '<cmd>NvimTreeToggle<CR>')
end
