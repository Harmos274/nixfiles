return function ()
  local map = require("utils").map
  local telescope = require('telescope')
  local actions = require('telescope.actions')

  telescope.setup {
    defaults = {
      mappings = {
        n = {
          ['q'] = actions.close,
        }
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }


  telescope.load_extension('fzf')

  map('n', '<C-p>', '<cmd>Telescope find_files<CR>')
  map('n', '<C-g>', '<cmd>Telescope live_grep<CR>')
  map('n', '<C-s>', '<cmd>Telescope lsp_references<CR>')
  map('n', '<C-b>', '<cmd>Telescope buffers<CR>')
end
