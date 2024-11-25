return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      --Java debugger adapter settings
      -- dap.configurations.java = {
      --   {
      --     name = "Debug (Attach) - Remote",
      --     type = "java",
      --     request = "attach",
      --     hostName = "127.0.0.1",
      --     port = 5005,
      --   },
      --   {
      --     name = "Debug Non-Project class",
      --     type = "java",
      --     request = "launch",
      --     program = "${file}",
      --   },
      -- }

      -- Source: LunarVim
      local firefoxExecutable = "/usr/bin/firefox"
      if vim.fn.has("mac") == 1 then
        firefoxExecutable = "/Applications/Firefox.app/Contents/MacOS/firefox"
      end

      local custom_adapter = "pwa-node-custom"
      -- dap.adapters[custom_adapter] = function(cb, config)
      --   if config.preLaunchTask then
      --     local async = require("plenary.async")
      --     local notify = require("notify").async
      --
      --     async.run(function()
      --       ---@diagnostic disable-next-line: missing-parameter
      --       notify("Running [" .. config.preLaunchTask .. "]").events.close()
      --     end, function()
      --       vim.fn.system(config.preLaunchTask)
      --       config.type = "pwa-node"
      --       dap.run(config)
      --     end)
      --   end
      -- end

      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
        {
          type = "chrome",
          name = "Debug with Chrome",
          request = "attach",
          program = "${file}",
          -- cwd = "${workspaceFolder}",
          -- protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
          -- sourceMaps = true,
          sourceMapPathOverrides = {
            -- Sourcemap override for nextjs
            ["webpack://_N_E/./*"] = "${webRoot}/*",
            ["webpack:///./*"] = "${webRoot}/*",
          },
        },
        {
          name = "Debug with Firefox",
          type = "firefox",
          request = "launch",
          reAttach = true,
          sourceMaps = true,
          url = "http://localhost:6969",
          webRoot = "${workspaceFolder}",
          firefoxExecutable = firefoxExecutable,
        },
        {
          name = "Launch",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          name = "Attach to node process",
          type = "pwa-node",
          request = "attach",
          rootPath = "${workspaceFolder}",
          processId = require("dap.utils").pick_process,
        },
        {
          name = "Debug Main Process (Electron)",
          type = "pwa-node",
          request = "launch",
          program = "${workspaceFolder}/node_modules/.bin/electron",
          args = {
            "${workspaceFolder}/dist/index.js",
          },
          outFiles = {
            "${workspaceFolder}/dist/*.js",
          },
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/dist/*.js",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          name = "Compile & Debug Main Process (Electron)",
          type = custom_adapter,
          request = "launch",
          preLaunchTask = "npm run build-ts",
          program = "${workspaceFolder}/node_modules/.bin/electron",
          args = {
            "${workspaceFolder}/dist/index.js",
          },
          outFiles = {
            "${workspaceFolder}/dist/*.js",
          },
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/dist/*.js",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**" },
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          -- trace = true, -- include debugger info
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }

      dap.configurations.typescriptreact = dap.configurations.typescript
      dap.configurations.javascript = dap.configurations.typescript
      dap.configurations.javascriptreact = dap.configurations.typescript
    end,
  },
  -- Fix DAP ui auto closing
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
    end,
  },
}
