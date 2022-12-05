local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', '--depth', '1', install_path })
  execute 'packadd packer.nvim'
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer self management

  -- Git
  use { 'lewis6991/gitsigns.nvim', config = require('plugins.gitsigns') }

  -- Colorscheme
  -- use { 'marko-cerovac/material.nvim', config = require('plugins.material') }
  use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', config = require('plugins.rose-pine') }

  -- StatusLine
  use { 'hoob3rt/lualine.nvim', config = require('plugins.lualine') }

  -- Zen Mode
  use { 'Pocco81/true-zen.nvim', config = require('plugins.true-zen') }

  -- Nix file support
  use 'LnL7/vim-nix'

  -- PureScript file support
  use 'purescript-contrib/purescript-vim'

  -- Best trailing whitespace plugin (trails only on modified buffers and don't move the cursor)
  use 'axelf4/vim-strip-trailing-whitespace'

  -- User custom dressing on trees
  use { 'stevearc/dressing.nvim', config = function() require('dressing').setup() end }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.lspconfig'),
    requires = {
      {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix',
      },
      {
        'onsails/lspkind-nvim',
        config = require('plugins.lspconfig.lspkind')
      },
      'ray-x/lsp_signature.nvim',
    },
  }

  -- Smart alignment (Mainly for Haskell)
  use { 'junegunn/vim-easy-align' }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    commit = 'bba6fb67fdafc0af7c5454058dfbabc2182741f4',
    requires = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = require('plugins.cmp'),
  }

  -- Snippet for nvim-cmp
  use { 'hrsh7th/vim-vsnip', config = require('plugins.vsnip') }

  -- Treesitter
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = '<cmd>TSUpdate',
      config = require('plugins.treesitter'),
    },
    'nvim-treesitter/playground'
  }

  -- Telescope (Finder)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = require('plugins.telescope')
  }

  -- Add symbols pears on typing
  use {
    'steelsojka/pears.nvim',
    config = require('plugins.pears')
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Augmented buffer line
  --use {
  --  'akinsho/nvim-bufferline.lua',
  --  requires = 'kyazdani42/nvim-web-devicons',
  --  config = require('plugins.bufferline')
  --}

  -- VScode like icons on LSP autocompletion

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('plugins.nvimtree')
  }

end
)
