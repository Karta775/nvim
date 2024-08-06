
-- Get keymap
local map = vim.api.nvim_set_keymap

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ' '

-- Mappings
map("n", "<leader><space>", ":let @/=''<cr>", {})   -- Clear search
map("n", "<leader><leader>", "<C-W><C-W>", {})      -- Switch buffer
map("n", "<leader>r", ":luafile %<cr>", {})         -- Load current Lua file
map("n", "<leader>R", ":luafile ~/.config/nvim/init.lua<cr>", {}) -- Realod nvim config
map("n", "<leader>cn", ":Neorg ", {})               -- Run a Neorg command
map("n", "<leader>.", "/\\.#<CR>:let @/=''<CR>cf.", {}) -- Find a placeholder .#???#. and replace
map("i", "<leader><leader>", "<ESC>/\\.#<CR>:let @/=''<CR>cf.", {}) -- Find a placeholder .#???#. and replace
map('n', '<leader>t', ':execute "normal o** " . strftime(\'%H:%M\')<CR>o', {}) -- Insert time (org)
map('n', '<leader>i', ':Neorg index<CR>', {})       -- Neorg index
map('n', '<leader>git', ':LazyGit<CR>', {})         -- Open lazygit panel
map('i', '<leader>l', '<ESC>A', {})                 -- Go to end of line (insert)
map('i', '<leader>;', '<ESC>A;', {})                -- Insert a semicolon at end of line (insert)

-- Neovide copy/paste/save
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P=ap') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end


-- Allow clipboard copy paste in neovim
-- vim.g.neovide_input_use_logo = 1
-- map('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
map('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
map('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
map('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
