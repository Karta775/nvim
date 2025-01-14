return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    dependencies = {
      "nvim-neorg/lua-utils.nvim",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
    keys = {
      { "<leader>n", "", "+neorg" },
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Open index" },
      { "<leader>nj", "<cmd>Neorg journal today<cr>", desc = "Open today's journal" },
      { "<leader>nJ", "<cmd>Neorg journal<cr>", desc = "Open journal menu" },
    },
  },
  -- Make way for Neorg keybinds
  {
    "snacks.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>n", false },
      { "<leader>N", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    },
  },
}
