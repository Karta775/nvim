return {
  "saghen/blink.cmp",
  event = "InsertEnter",

  opts = {
    sources = {
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
    },

    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
  }
}
