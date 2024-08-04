
require('neorg').setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = { -- Adds pretty icons to your documents
      config = {
        icon_preset = "basic",
      },
    },
    ["core.qol.toc"] = {
      config = {
        close_after_use = true,
      }
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          general = "~/Notes/general",
          journal = "~/Notes/journal",
          uni = "~/Notes/uni",
        },
        default_workspace = "general",
      },
    },
  },
}

-- Mappings
local map = vim.api.nvim_set_keymap
map("n", "<leader>jt", ":Neorg journal today<CR>", {})
map("n", "<leader>jT", ":Neorg journal tomorrow<CR>", {})
map("n", "<leader>jy", ":Neorg journal yesterday<CR>", {})
map("n", "<LocalLeader>o", "<C-o>", {})

