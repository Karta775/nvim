return {
  {
    "nvim-neorg/neorg",
    event = "VeryLazy",
    version = "*",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
      { "juniorsundar/neorg-extras" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.keybinds"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {
            config = {
              strategy = "by_path"
            }
          },
          ["core.integrations.telescope"] = {},
          ["core.journal"] = {
            config = {
              journal_folder = "",
              workspace = "journal"
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/norg/notes",
                journal = "~/norg/journal",
              },
              default_workspace = "notes",
            },
          },
          ["external.agenda"] = {},
          ["external.roam"] = {},
          ["external.many-mans"] = {
            config = {
              treesitter_fold = true
            }
          },
        },
      })
    end,
  },
}
