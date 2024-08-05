local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  -- Theme stuff
  use 'zaldih/themery.nvim' -- Theme manager
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"

  -- Comment helper (similar to tpope/commentary)
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Surround
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  }

  -- LSP stuff
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*", -- follow latest release.
    run = "make install_jsregexp" -- install jsregexp (optional!:).
  })

  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- IDE stuff
  use 'windwp/nvim-autopairs'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use { -- Fuzzy search
     'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { -- Lualine information / status bar
     'nvim-lualine/lualine.nvim',
     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'ahmedkhalf/project.nvim'
  use {'kdheepak/lazygit.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Utilities
  use 'dstein64/vim-startuptime' -- Use :StartupTime to profile startup

  -- Startup screen
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
end)
