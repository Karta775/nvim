
require'nvim-treesitter.configs'.setup {
  -- List parser names
  ensure_installed = { "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Enable highlighting
  highlight = { enable = true },
}

