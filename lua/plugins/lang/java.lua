return {
  "mfussenegger/nvim-jdtls",
  opts = {
    settings = {
      java = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
        },
        saveActions = {
          organizeImports = true,
        },
      },
    },
  },
}
