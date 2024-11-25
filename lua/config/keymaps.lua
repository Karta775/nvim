-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("i", "<A-CR>", "<ESC>0ely0o<ESC>pA ", { desc = "Continue comment" })
