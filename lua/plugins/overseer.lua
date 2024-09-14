return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",
  config = function()
    require("overseer").setup({})

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
