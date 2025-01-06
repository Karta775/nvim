-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local map = LazyVim.safe_keymap_set

map("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("i", "<A-CR>", "<ESC>0ely0o<ESC>pA ", { desc = "Continue comment" })

wk.add({
  { "<leader>j", group = "java" }, -- group
})
map("n", "<leader>jn", "<cmd>JavaNewClass<cr>", { desc = "Create Java class" })

-- NOTE: See plugins/refactoring.lua for original <leader>rs
map("n", "<leader>rs", "<cmd>sort<cr>", { desc = "Sort all lines" })
map("v", "<leader>rs", ":sort<cr>", { desc = "Sort lines" })
