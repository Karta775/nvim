local defaultHeader = "         \
                      /|、      \
     諦めないで      (˚ˎ 。7    \
    NEVER GIVE UP     |、˜〵    \
                      じしˍ,)ノ "

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

local function get_custom_or_default_header()
  local headerPath = vim.fn.stdpath("config") .. "/header.txt"
  if not file_exists(headerPath) then
    return defaultHeader
  end
  local header = ""
  for line in io.lines(headerPath) do
    header = header .. line .. "\n"
  end
  return header
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      preset = {
        header = get_custom_or_default_header(),
      },
      formats = {
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
      },

      sections = {
        { section = "header", padding = 3 },
        { section = "keys", gap = 1, padding = 3 },
        { section = "startup" },
      },
    },
  },
}
