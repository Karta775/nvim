-- Instant background color
local f = io.open(vim.env.HOME .. "/.cache/darkmode.bool", "r")
if f ~= nil then
  local mode = f:read()
  if mode == "true" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
  io.close(f)
end

-- Other options
require("core.options")

-- Handle plugins with lazy.nvim
require("core.lazy")
-- TODO: install the plugin that highlights whatever you yank

-- General Neovim keymaps
require("core.keymaps")

-- Autocmds
require("core.autocmds")
