return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", ":%s//g<Left><Left>", mode = "n", desc = "Sed replace in file" },
      { "<leader>sr", ":s//g<Left><Left>", mode = "v", desc = "Sed replace in selection" },
      {
        "<leader>sR",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
}
