local set = vim.opt

set.foldlevelstart = 15

-- Make filenames autocompletion case-insensitive
set.wildignorecase = true
-- Make search case insensitive if all lowercase
set.ignorecase = true
set.smartcase = true

-- When replacing, replace globally without using '/g'
set.gdefault = true

-- Set line numbers and relatives
set.number = true
set.relativenumber = true

-- Set cursor scroll distance
set.scrolloff = 12

-- Shorten key sequence timeout
set.timeoutlen = 200

-- Use the clipboard as default register
set.clipboard = 'unnamedplus'

-- Set indent length
set.tabstop = 2
set.shiftwidth = 0
set.expandtab = true

-- Disable duplicate mode display
set.showmode = false

-- Save undo's after file closes
set.undofile = true

-- How many undos
set.undolevels = 1000

-- Number of lines to save for undo
set.undoreload = 10000

-- Set mouse in buffer
set.mouse = 'a'

-- Needed by bufferline and themes
set.termguicolors = true

-- No wrap by default
set.wrap = false

-- Remove the `~` on all non existent lines, and `.` on the foldlines
vim.opt.fillchars = { eob = " ", fold = " " }
