return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'stevearc/dressing.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
      },
    },
    event = "VeryLazy",
    config = function()
      require("telescope").setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")

      local map = require('helpers.keys').map

      -- Keymaps (find)
      map("n", "<leader><leader>", ':lua require"telescope.builtin".find_files({no_ignore=false, hidden=false})<CR>',
        "Files")
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

      -- Keymaps (search)
      map("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, "Search in current buffer")
      map("n", "<leader>sh", ":Telescope help_tags<cr>", "Help files")
      map("n", "<leader>sk", ":Telescope keymaps<cr>", "Keymaps")
      map("n", "<leader>sp", ":Telescope yank_history<cr>", "Yank history")
    end,
  },
}
