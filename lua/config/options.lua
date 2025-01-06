-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ","
vim.g.autoformat = true
vim.g.snacks_animate = false
vim.g.ai_cmp = false
vim.o.relativenumber = false

vim.filetype.add({
  extension = {
    njk = "jinja",
  },
})
vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}
