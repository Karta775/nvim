-- LSP Configuration & Plugins
return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "RRethy/vim-illuminate",
    },
    config = function()
      -- Set up Mason before anything else
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pylsp",
        },
        automatic_installation = true,
      })
      require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function()
          require("rust-tools").setup({})
        end,
      })

      -- Quick access via keymap
      require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

      -- Neodev setup before LSP config
      require("neodev").setup()

      -- Set up cool signs for diagnostics
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Diagnostic config
      local config = {
        virtual_text = false,
        signs = {
          active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }
      vim.diagnostic.config(config)

      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(client, bufnr)
        local lsp_map = require("helpers.keys").lsp_map

        lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
        lsp_map("<leader>lR", vim.lsp.buf.references, bufnr, "References")
        lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
        lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")
        lsp_map("<leader>lf", ":lua vim.lsp.buf.format()<CR>", "Format file")
        lsp_map("<space>ll", vim.diagnostic.open_float, "Show diagnostic")
        lsp_map("<space>lq", vim.diagnostic.setloclist, "Location list")
        lsp_map("<leader>lD", vim.lsp.buf.declaration, bufnr, "Go to declaration")
        lsp_map("<leader>ld", vim.lsp.buf.definition, bufnr, "Go to definition")
        lsp_map("<leader>li", vim.lsp.buf.implementation, bufnr, "Implementation")
        lsp_map("<leader>lh", vim.lsp.buf.signature_help, bufnr, "Signature help")
        lsp_map("<leader>lH", vim.lsp.buf.hover, bufnr, "Hover")
        lsp_map("<leader>lwa", vim.lsp.buf.add_workspace_folder, bufnr, "Add folder")
        lsp_map("<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufnr, "Remove folder")
        lsp_map("<leader>lwl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufnr, "List folders")
        lsp_map("<leader>lt", bufnr, vim.lsp.buf.type_definition, bufnr, "Go to type definition")
        lsp_map("<leader>lc", vim.lsp.buf.code_action, bufnr, "Code action")

        lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
        lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
        lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
        lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
        lsp_map("gx", vim.diagnostic.open_float, bufnr, "Show diagnostics under cursor")
        lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")

        lsp_map("[d", vim.diagnostic.goto_prev, bufnr, "Previous LSP diagnostic")
        lsp_map("]d", vim.diagnostic.goto_next, bufnr, "Next LSP diagnostic")

        -- Attach and configure vim-illuminate
        require("illuminate").on_attach(client)
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
        },
      })
    end,
  },
}
