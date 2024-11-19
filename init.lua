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

-- Main config
require("core.options")
require("core.lazy")
require("core.keymaps")
require("core.autocmds")
require("core.highlight")
