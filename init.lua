-- Set proper indentation
local indent = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent

-- Remove command line
vim.opt.cmdheight = 0
vim.opt.laststatus = 0

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show file stats
vim.opt.ruler = true

-- Disable bell completely
vim.opt.belloff = "all"

-- Last line
vim.opt.showmode = true
vim.opt.showcmd = true

-- Popup window transparency
vim.opt.pumblend = 10
vim.opt.winblend = 10

-- Fold settings
vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 99

-- Miscellaneous
vim.opt.conceallevel = 3

-- Neovide specific
if vim.g.neovide then
  vim.g.neovide_input_macos_alt_is_meta = true -- Let option be alt
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
end

-- Lua modules
require('plugins')
require('style')
require('key-mappings')
require('mason-config')
require('code-completion')
require('auto-commands')
require('file-explorer')
require('syntax-highlighting')
require('file-finder')
require('auto-pairs')
require('statusbar')
require('project-manager')
