
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Run packer sync after changing plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Return to the line on which the file was last closed
autocmd("BufReadPost", {
  pattern = {"*"},
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"",false)
    end
  end
})

-- Neovide specific
if vim.g.neovide then
  -- Fix scale on startup
  autocmd('UIEnter', {
    command = "lua vim.g.neovide_scale_factor = 1.01"
  })
end

-- Only load alacritty padding fix on Linux
if vim.loop.os_uname().sysname == "Linux" then
  -- Alacritty: remove padding on enter
  autocmd('UIEnter', {
    command = "silent !zsh -c 'alacritty msg config --window-id $WINDOWID window.padding.{x,y}=0'"
  })
  -- Alacritty recover padding on exit
  autocmd('UILeave', {
    command = "silent !zsh -c 'alacritty msg config --window-id $WINDOWID window.padding.{x,y}=10'"
  })
end

