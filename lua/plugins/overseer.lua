return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",
  config = function()
    require("overseer").setup({})


    -- Keymaps
    -- TODO: Eventually make this so that <leader>cc auto compiles based on filetype
    -- and <leader>cC lets you enter something custom.
    local map = require('helpers.keys').map
    map("n", "<leader>cc", "<cmd>OverseerQuickAction<cr>", "Quick action list")
    map("n", "<leader>cx", "<cmd>OverseerQuickAction restart<cr>", "Restart current task")
    map("n", "<leader>cr", "<cmd>OverseerRun<cr>", "Run")
    map("n", "<leader>ct", "<cmd>OverseerToggle<cr>", "Show tasks")


    local overseer = require("overseer")
    overseer.register_template({
      name = "python",
      builder = function()
        return {
          cmd = { "python" },
          args = { vim.fn.expand("%:p") },
          name = "python",
        }
      end,
      desc = "Run a python script",
      tags = { overseer.TAG.RUN },
      condition = {
        filetype = { "py", "python" },
      },
    })
    overseer.register_template({
      name = "java",
      builder = function()
        return {
          cmd = { "./gradlew" },
          args = { "bootRun" },
          name = "Spring Boot (gradle)",
        }
      end,
      desc = "Run Spring Boot App (gradle)",
      tags = { overseer.TAG.RUN },
      condition = {
        filetype = { "java" },
      },
    })
    overseer.register_template({
      name = "java",
      builder = function()
        return {
          cmd = { "./mvnw" },
          args = { "spring-boot:run" },
          name = "Spring Boot (maven)",
        }
      end,
      desc = "Run Spring Boot App (maven)",
      tags = { overseer.TAG.RUN },
      condition = {
        filetype = { "java" },
      },
    })
  end,
}
