
-- Configuration
vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    always_show_bufferline = "false",
  }
}

-- Mappings
local map = vim.api.nvim_set_keymap

-- Go to tab n (either leader+n or n+leader)
for i = 1,9 do
  map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>", {})
  map("n", i .. "<leader>", ":BufferLineGoToBuffer " .. i .. "<cr>", {})
end
-- Close tab/buffer
map("n", "<leader>w", ":bp <bar> bd #<cr> ", {})
-- Cycle buffers
map("n", "<leader>b", ":BufferLineCyclePrev <cr>", {})
map("n", "<leader>n", ":BufferLineCycleNext <cr>", {})
map("n", ";", ":BufferLineCycleNext <cr>", {})

