
local map = vim.api.nvim_set_keymap

local function theme(name, identifier)
  return {
    name = name,
    colorscheme = identifier,
    after = [[
      vim.cmd("highlight lualine_c_inactive guibg=NONE")
      vim.cmd("highlight lualine_c_normal guibg=NONE")
    ]]
  }
end

-- Themery config
require("themery").setup({
  themes = { -- List of installed colorschemes.
    theme("Kanagawa Dragon", "kanagawa-dragon"),
    theme("Kanagawa Lotus", "kanagawa-lotus"),
    theme("Kanagawa Wave", "kanagawa-wave"),
    theme("Catppuccin Latte", "catppuccin-latte"),
    theme("Catppuccin Frappe", "catppuccin-frappe"),
    theme("Catppuccin Macchiato", "catppuccin-macchiato"),
    theme("Catppuccin Mocha", "catppuccin-mocha"),
  },
  livePreview = true,
})

map('n', '<leader>th', '<cmd>Themery<cr>', {})
