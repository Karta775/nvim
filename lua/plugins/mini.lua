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

local banner_small_cat_ngu = "  \
                      /|、      \
     諦めないで      (˚ˎ 。7    \
    NEVER GIVE UP     |、˜〵    \
                      じしˍ,)ノ "

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
      require("mini.pairs").setup({
        mappings = {
          -- Prevents the action if the cursor is just before any character or next to a "\".
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]" },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]" },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]" },
          -- This is default (prevents the action if the cursor is just next to a "\").
          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
          -- Prevents the action if the cursor is just before or next to any character.
          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
        }
      })
      require("mini.surround").setup()
      require("mini.tabline").setup()

      require("mini.sessions").setup({
        autoread = false,
        autowrite = true,
        directory = vim.env.HOME .. "/.local/share/nvim/session",
      })
      require("mini.statusline").setup()

      local starter = require('mini.starter')
      local awk_arg = '{s=(36-length($0))/2; printf "%*s%s%*s\\n", s, "", $0, s, ""}'
      starter.setup({
        items = {
          starter.sections.builtin_actions(),
          starter.sections.telescope(),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning('center', 'center'),
        },
        header = banner_small_cat_ngu,
        -- footer = vim.fn.system("fortune -s -n 36 | awk '" .. awk_arg .. "'"),
        footer = "",
        -- footer = function()
        --   local stats = require("lazy").stats()
        --   local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --   return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        -- end,
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
      vim.notify = notify.make_notify()
    end,
  },
  -- { -- Has its own spec for the event
  --   "echasnovski/mini.statusline",
  --   version = false,
  --   opts = {},
  --   event = "VeryLazy",
  -- },
}
