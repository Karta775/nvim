return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function() -- Terminal
      local tt = require("toggleterm")
      tt.setup({
        -- open_mapping = [[<m-`>]], -- ToggleTerm with alt-`
        autochdir = true,
        close_on_exit = true,
      })

      local map = vim.keymap.set
      local Terminal = require("toggleterm.terminal").Terminal

      Terminal:new({ name = "bottom" })

      local lazygit = Terminal:new({
        cmd = "lazygit",
        -- dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })
      local ncmpcpp = Terminal:new({
        cmd = "ncmpcpp",
        name = "ncmpcpp",
        direction = "float",
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "q",
            "<cmd>ToggleTerm name='ncmpcpp'<CR>",
            { noremap = true, silent = true }
          )
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })
      local ranger_tmpfile = vim.fn.tempname()
      local ranger = Terminal:new({
        cmd = 'yazi --cwd-file "' .. ranger_tmpfile .. '"',
        name = "ranger",
        close_on_exit = true,
        on_exit = function(term)
          vim.cmd("ToggleTerm name='ranger'")
          local file = io.open(ranger_tmpfile, "r")
          if file ~= nil then
            local path = file:read("*a")
            file:close()
            os.remove(ranger_tmpfile)
            vim.cmd("cd " .. path)
          end
        end,
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })
      function _lazygit_toggle()
        lazygit:toggle()
      end
      function _ncmpcpp_toggle()
        ncmpcpp:toggle()
      end
      function _ranger_toggle()
        ranger:toggle()
      end

      map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "LazyGit" })
      map("n", "<leader>tm", "<cmd>lua _ncmpcpp_toggle()<CR>", { desc = "Music player" })
      map("n", "<leader>tr", "<cmd>lua _ranger_toggle()<CR>", { desc = "Ranger" })
    end,
  },
}
