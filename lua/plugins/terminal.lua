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
      local music_player = Terminal:new({
        cmd = "ncmpcpp",
        name = "music_player",
        direction = "float",
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "q",
            "<cmd>ToggleTerm name='music_player'<CR>",
            { noremap = true, silent = true }
          )
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })
      local file_manager_tmpfile = vim.fn.tempname()
      local file_manager = Terminal:new({
        cmd = 'yazi --cwd-file "' .. file_manager_tmpfile .. '"',
        name = "file_manager",
        close_on_exit = true,
        on_exit = function(term)
          vim.cmd("ToggleTerm name='file_manager'")
          local file = io.open(file_manager_tmpfile, "r")
          if file ~= nil then
            local path = file:read("*a")
            file:close()
            os.remove(file_manager_tmpfile)
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
      function _music_player_toggle()
        music_player:toggle()
      end
      function _file_manager_toggle()
        file_manager:toggle()
      end

      map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "LazyGit" })
      map("n", "<leader>tm", "<cmd>lua _music_player_toggle()<CR>", { desc = "Music player" })
      map("n", "<leader>tr", "<cmd>lua _file_manager_toggle()<CR>", { desc = "File manager" })
    end,
  },
}
