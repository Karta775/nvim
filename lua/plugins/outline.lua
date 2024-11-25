return {
  "hedyhli/outline.nvim",
  opts = {
    outline_window = {
      -- position = "bottom",
      split_command = "16split",

      -- width = 15,
      -- relative_width = true,

      jump_highlight_duration = 0,
      auto_close = true,
      auto_jump = true,
      center_on_jump = true,

      -- Vim options for the outline window
      show_numbers = false,
      show_relative_numbers = false,
      wrap = false,

      show_cursorline = true,
    },
    symbol_folding = {
      autofold_depth = 2,
      auto_unfold = {
        hovered = true,
        only = true,
      },
      markers = { "", "" },
    },
  },
}
