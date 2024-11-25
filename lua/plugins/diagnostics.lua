return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = false,
      severity_sort = true,
      signs = {
        severity = "WARN", -- Fixes the dumb TODO diagnostics
      },
    },
  },
}
