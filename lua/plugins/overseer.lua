return {
  "stevearc/overseer.nvim",
  keys = {
    { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Task list" },
    { "<leader>oo", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
    { "<leader>ot", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>of", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>oh", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
  },
  config = function()
    require("overseer").setup({})
    local overseer = require("overseer")

    -- Python
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

    -- Java
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

    -- npm run
    overseer.register_template({
      name = "npm run",
      builder = function()
        return {
          cmd = { "npm" },
          args = { "run", vim.fn.expand("%:p") },
        }
      end,
      condition = {
        filetype = { "typescript", "javascript" },
      },
    })

    -- Javascript run single file
    overseer.register_template({
      name = "Javscript run single file",
      builder = function()
        return {
          cmd = { "node" },
          args = { vim.fn.expand("%:p") },
        }
      end,
      condition = {
        filetype = { "typescript", "javascript" },
      },
    })
  end,
}
