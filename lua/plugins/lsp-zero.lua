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
        "ray-x/lsp_signature.nvim",
        opts = {},
      },
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            -- event = "VeryLazy"
          },
        },
      },
      { "saadparwaiz1/cmp_luasnip" },
      { "pmizio/typescript-tools.nvim" },
    },
    branch = "v4.x",
    -- event = "VeryLazy",
    lazy = false,
    config = function()
      local lsp_zero = require("lsp-zero")

      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })
        -- Asynchronous
        if client.supports_method("textDocument/formatting") then
          require("lsp-format").on_attach(client)
        end
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      require("typescript-tools").setup({
        capabilities = lsp_zero.get_capabilities(),
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
        },
        settings = {
          tsserver_plugins = {
            "@vue/typescript-plugin",
          },
        },
      })

      -- Mason setup
      require("mason").setup({})
      require("mason-lspconfig").setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = { "lua_ls", "rust_analyzer", "pylsp" },
        handlers = {
          rust_analyzer = function()
            require('lspconfig')['rust_analyzer'].setup({
              completion = {
                callable = {
                  snippets = "none",
                }
              }
            })
          end,
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      -- Autocompletion setup
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_action = require("lsp-zero").cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").load({ paths = "./snippets" })

      cmp.setup({
        sources = {
          { name = 'path' },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = 'buffer',  keyword_length = 3 },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<M-j>'] = cmp.mapping.scroll_docs(4),
          ['<M-k>'] = cmp.mapping.scroll_docs(-4)
        }),
      })
    end,
  },
}
