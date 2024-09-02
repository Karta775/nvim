local map = require("helpers.keys").map

-- which-key
local wk = require("which-key")
wk.add({
  { "<leader>L",  group = "Lazy" },
  { "<leader>a",  group = "Avante" },
  { "<leader>b",  group = "Buffer" },
  { "<leader>d",  group = "Delete" },
  { "<leader>f",  group = "Find" },
  { "<leader>g",  group = "Git" },
  { "<leader>l",  group = "LSP" },
  { "<leader>lw", group = "Workspace" },
  { "<leader>n",  group = "Neorg" },
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
map({"i", "t"}, "<s-space>", " ", "Ignore shift-space")

-- Toggle
-- NOTE: There are some keymaps in terminal.lua
map("n", "<leader>tz", "<cmd>ZenMode<cr>", "Zen mode")
map({ "n", "i", "t" }, "<m-`>", "<cmd>5ToggleTerm<cr>", "Toggle terminal")
map("n", "<leader>tt", "<cmd>Toc<cr>", "Table of contents")

-- Yanky (better yank)
map({"n","x"}, "p", "<Plug>(YankyPutAfter)", "Put")
map({"n","x"}, "P", "<Plug>(YankyPutBefore)", "Put before")
map({"n","x"}, "gp", "<Plug>(YankyGPutAfter)", "G put")
map({"n","x"}, "gP", "<Plug>(YankyGPutBefore)", "G put before")
map("n", "<c-p>", "<Plug>(YankyPreviousEntry)", "Previous yank")
map("n", "<c-n>", "<Plug>(YankyNextEntry)", "Next yank")

-- Search
map("n", "<leader>sh", ":Telescope help_tags<cr>", "Help files")
map("n", "<leader>sk", ":Telescope keymaps<cr>", "Keymaps")
map("n", "<leader>sp", ":Telescope yank_history<cr>", "Yank history")

-- Neorg
map("n", "<leader>nw", "<Plug>(neorg.telescope.switch_workspace)", "Workspace")
map("n", "<leader>nh", "<Plug>(neorg.telescope.search_headings)", "Headings")
map("n", "<leader>nb", "<Plug>(neorg.telescope.file_backlinks)", "Backlinks")
map("n", "<leader>nn", ":Neorg ", "Open")
map("n", "<leader>nt", ":execute \"normal o** \" . strftime('%H:%M')<CR>o", "Insert current time")
map("n", "<leader>ni", ":Neorg index<CR>", "Open index")
map("n", "<leader>nf", "<Plug>(neorg.telescope.find_norg_files)", "Open note")
map("n", "<leader>nl", "<Plug>(neorg.telescope.find_linkable)", "Link note")
map("n", "<leader>nj", ":Neorg journal today<cr>", "Today")

-- Nvim Tree
map({ "n", "v" }, "<leader>e", "<cmd>NvimTreeToggle<cr>", "Toggle file explorer")

-- Search
map("n", "<leader>ff", ':lua require"telescope.builtin".find_files({no_ignore=false, hidden=false})<CR>', "Files")
map(
  "n",
  "<leader>fF",
  ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>',
  "Files (hidden)"
)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", "Recent files")
map("n", "<leader>fc", ':Telescope find_files search_dirs={"~/.config/nvim"}<CR>', "nvim config")
map("n", "<leader>fC", ':Telescope find_files search_dirs={"~/.config"}<CR>', "~/.config")
map("n", "<leader>fd", ':Telescope find_files search_dirs={"~/docs"}<CR>', "Docs")
map("n", "<leader>fD", ':Telescope find_files search_dirs={"~/Documents"}<CR>', "Documents")
map("n", "<leader>fk", ":Telescope keymaps<CR>", "Keymaps")
map(
  "n",
  "<leader>fo",
  ':lua require"telescope.builtin".find_files({find_command = { "rg", "--files", "--glob", "**/*.org", vim.env.HOME .. "/org" }})<CR>',
  "Org files"
)
map("n", "<leader>fg", ':lua require"telescope.builtin".live_grep()<CR>', "Strings (ripgrep)")
map("n", "<leader>fp", ':lua require"telescope".extensions.projects.projects{}<CR>', "Projects")
map("n", "<leader>fb", ":Telescope buffers<CR>", "Buffers")
map("n", "<leader><space>", require("telescope.builtin").buffers, "Find buffers")
map("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, "Search in current buffer")

-- Lazy
map("n", "<leader>LL", ":Lazy<CR>", "Lazy")
map("n", "<leader>LS", ":Lazy sync<CR>", "Sync")
map("n", "<leader>LC", ":Lazy sync<CR>", "Clean")

-- LSP
-- See core/autocmds.lua

-- Session
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>qr", ":lua MiniSessions.write('reload')<cr> :lua os.exit(101)<cr>", "Restart neovim")

-- Window
map("n", "<leader>ww", "<C-w><C-w>", "Cycle windows")
map("n", "<leader>wq", "<C-w><C-q>", "Close window")
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Buffer
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Current buffer")
map("n", "<leader>bD", buffers.delete_others, "Other buffers")
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
