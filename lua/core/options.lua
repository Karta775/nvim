local indent = 2

vim.o.shiftwidth = indent
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.expandtab = true
vim.o.virtualedit = "block"
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.belloff = "all"
vim.o.foldlevelstart = 99
vim.o.foldmethod = "manual"
vim.o.conceallevel = 3
vim.o.ruler = true -- File stats
vim.o.number = true
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.autochdir = false
vim.o.inccommand = "split"
vim.o.ignorecase = true           -- Ignore case in searches
vim.o.clipboard = "unnamedplus"   -- Use system clipboard
vim.cmd("set formatoptions-=cro") -- Disable continuation of comments on newline
vim.o.cursorline = true

-- Neovide specific
if vim.g.neovide then
  local map = require("helpers.keys").map
  map({ "n", "v" }, "<D-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  map({ "n", "v" }, "<D-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  map({ "n", "v" }, "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
  map("i", "<D-=>", "<esc>:lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>a")
  map("i", "<D-->", "<esc>:lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>a")
  map("i", "<D-0>", "<esc>:lua vim.g.neovide_scale_factor = 1<CR>a")
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_transparency = 1
  vim.g.neovide_window_blurred = false
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_floating_shadow = false
  vim.o.guifont = "FiraCode Nerd Font:h15.5"
end
