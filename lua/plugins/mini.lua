local function mini_files_toggle_hidden()
  local show_dotfiles = false

  local filter_show = function(fs_entry) return true end

  local filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, '.')
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id
      vim.keymap.set('n', '.', toggle_dotfiles, { buffer = buf_id })
    end,
  })
end

local function mini_files_bookmarks()
  local set_mark = function(id, path, desc)
    MiniFiles.set_bookmark(id, path, { desc = desc })
  end
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      set_mark('c', vim.fn.stdpath('config'), 'Config') -- path
      set_mark('w', vim.fn.getcwd, 'Working directory') -- callable
      set_mark('~', '~', 'Home directory')
    end,
  })
end

return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    version = false,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.diff").setup()
      require("mini.files").setup({
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 80,
        },
      })
      mini_files_bookmarks()
      mini_files_toggle_hidden()

      require("mini.git").setup()
      require("mini.icons").setup()
      require("mini.jump").setup()
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      -- require("mini.surround").setup() TODO: Come up with better mappings
      require("mini.tabline").setup()

      require("mini.sessions").setup({
        autoread = false,
        autowrite = true,
        directory = vim.env.HOME .. "/.local/share/nvim/session",
      })

      require("mini.jump2d").setup({
        mappings = {
          start_jumping = "<C-f>",
        },
      })

      local notify = require("mini.notify")
      notify.setup({
        lsp_progress = {
          enable = false,
        },
      })
      -- vim.notify = notify.make_notify()
    end,
  },
  { -- Has its own spec for the event
    "echasnovski/mini.statusline",
    version = false,
    opts = {},
    event = "VeryLazy",
  },
}
