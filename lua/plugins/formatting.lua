return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- typescript = { "eslint" },
        typescript = function(bufnr)
          if require("conform").get_formatter_info("biome", bufnr).available then
            return { "vtsls", lsp_format = "never" }
          else
            return { "eslint" }
          end
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- other settings removed for brevity
    opts = {
      setup = {
        eslint = function()
          if not auto_format then
            return
          end

          local function get_client(buf)
            return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
          end

          require("lspconfig").vtsls.setup({
            on_attach = function(client, bufnr)
              client.resolved_capabilities.document_formatting = false
              client.resolved_capabilities.document_range_formatting = false
            end,
          })

          local formatter = LazyVim.lsp.formatter({
            name = "eslint: lsp",
            primary = true,
            priority = 200,
            filter = "eslint",
          })

          -- Use EslintFixAll on Neovim < 0.10.0
          if not pcall(require, "vim.lsp._dynamic") then
            formatter.name = "eslint: EslintFixAll"
            formatter.sources = function(buf)
              local client = get_client(buf)
              return client and { "eslint" } or {}
            end
            formatter.format = function(buf)
              local client = get_client(buf)
              if client then
                local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end
          end

          -- register the formatter with LazyVim
          LazyVim.format.register(formatter)
        end,
      },
    },
  },
}
