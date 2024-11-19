local map = require("helpers.keys").map

-- which-key
local wk = require("which-key")
wk.add({
  { "<leader>L",  group = "Lazy" },
  { "<leader>a",  group = "Avante" },
  { "<leader>b",  group = "Buffer" },
  { "<leader>c",  group = "Code" },
  { "<leader>d",  group = "Delete" },
  { "<leader>f",  group = "Find" },
  { "<leader>g",  group = "Git" },
  { "<leader>l",  group = "LSP" },
  { "<leader>lw", group = "Workspace" },
  { "<leader>o",  group = "Open" },
  { "<leader>q",  group = "Session" },
  { "<leader>s",  group = "Search" },
  { "<leader>t",  group = "Toggle" },
  { "<leader>u",  group = "UI" },
  { "<leader>w",  group = "Window" },
})

-- Miscellaneous
map("n", "<leader>r", ":luafile %<cr>", "Source current lua file")
map("n", "[[", "<ESC><C-o>", "Navigate back")
map("n", "]]", "<ESC><C-i>", "Navigate forward")
map("n", "<esc>", ":nohl<cr><esc>", "Clear search highlighting")
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")
map("v", "<", "<gv", "Stay in indent mode")
map("v", ">", ">gv", "Stay in indent mode")
map("i", "jk", "<esc>", "Leave insert mode")
map({ "i", "t" }, "<s-space>", " ", "Ignore shift-space")

-- Toggle
-- NOTE: There are some keymaps in terminal.lua
map({ "n", "i", "t" }, "<m-`>", "<cmd>5ToggleTerm<cr>", "Toggle terminal")
map("n", "<leader>tz", "<cmd>ZenMode<cr>", "Zen mode")
map("n", "<leader>td", MiniDiff.toggle_overlay, "Diff overlay")
map("n", "<leader>tD", MiniDiff.toggle, "Diff")

-- File manager
map({ "n", "v" }, "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, "Open file manager (current file)")
map({ "n", "v" }, "<leader>E", MiniFiles.open, "Open file manager (cwd)")

-- Lazy
map("n", "<leader>L", ":Lazy<CR>", "Lazy")

-- LSP
-- See core/autocmds.lua

-- Session
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>qr", ":lua MiniSessions.write('reload')<cr> :lua os.exit(101)<cr>", "Restart neovim")

-- Window
map("n", "<leader>ww", "<C-w><C-w>", "Cycle windows")
map("n", "<leader>wq", "<C-w><C-q>", "Close window")
map("n", "<leader>ws", ":split<CR>", "Horizontal split")
map("n", "<leader>wv", ":vsplit<CR>", "Vertical split")
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")
map({ "n", "t" }, "<C-Up>", "<cmd>resize +2<CR>")
map({ "n", "t" }, "<C-Down>", "<cmd>resize -2<CR>")
map({ "n", "t" }, "<C-Left>", "<cmd>vertical resize +2<CR>")
map({ "n", "t" }, "<C-Right>", "<cmd>vertical resize -2<CR>")

-- Buffer
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Current buffer")
map("n", "<leader>bo", buffers.delete_others, "Other buffers")
map("n", "<leader>ba", buffers.delete_all, "All buffers")
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- UI
map("n", "<leader>up", ':lua require"telescope.builtin".colorscheme()<CR>', "Pick theme")
map("n", "<leader>ut", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, "Toggle between light and dark themes")

-- Neovide copy/paste/save
if vim.g.neovide then
  map("n", "<D-s>", ":w<CR>", "Save")
  map("v", "<D-c>", '"+y', "Copy")
  map("n", "<D-v>", '"+P=ap', "Paste normal mode")
  map("v", "<D-v>", '"+P', "Paste visual mode")
  map("c", "<D-v>", "<C-R>+", "Paste command mode")
  map("i", "<D-v>", '<ESC>l"+Pli', "Paste insert mode")
  map("!", "<D-v>", "<C-R>+", "Paste")
  map("t", "<D-v>", "<C-R>+", "Paste")
  map("v", "<D-v>", "<C-R>+", "Paste")
end

-- Disable arrow keys
-- map({ "n", "v" }, "<Up>", "<Nop>", "Disable arrow keys")
-- map({ "n", "v" }, "<Down>", "<Nop>", "Disable arrow keys")
-- map({ "n", "v" }, "<Left>", "<Nop>", "Disable arrow keys")
-- map({ "n", "v" }, "<Right>", "<Nop>", "Disable arrow keys")

-- map("i", "<S-Space>", "<Right>", "Go right in insert mode")
