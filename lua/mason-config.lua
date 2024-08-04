
-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Language servers
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}
require("lspconfig").pylsp.setup {}
