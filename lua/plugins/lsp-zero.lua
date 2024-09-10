return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/nvim-cmp" },
      { "lukas-reineke/lsp-format.nvim" },
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            event = "VeryLazy"
          },
        },
      },
      { "saadparwaiz1/cmp_luasnip" },
      { "ray-x/lsp_signature.nvim", }
    },
    branch = "v4.x",
    event = "VeryLazy",
    config = function()
      local lsp_zero = require("lsp-zero")

      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })
        -- Synchronous
        -- lsp_zero.buffer_autoformat()
        -- Asynchronous
        if client.supports_method("textDocument/formatting") then
          require("lsp-format").on_attach(client)
        end
        -- Set up signature help
        require("lsp_signature").setup()
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Mason setup
      require("mason").setup({})
      require("mason-lspconfig").setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = { "lua_ls", "rust_analyzer", "pylsp" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      -- Autocompletion setup
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
      })
    end,
  },
}
