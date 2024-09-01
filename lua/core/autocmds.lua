vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*.*" },
  desc = "save view (folds), when closing file",
  command = "mkview",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  desc = "load view (folds), when opening file",
  command = "silent! loadview",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst", "md", "org", "norg", "AvanteInput" },
  desc = "Linewrap plaintext formats",
  command = "set linebreak | set wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dashboard" },
  desc = "Disable statusline in dashboard",
  callback = function()
    vim.b.ministatusline_disable = true
    vim.b.laststatus = 0
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "norg",
  desc = "Set up neorg which-key",
  callback = function()
    local wk = require("which-key")
    wk.add({ "<localleader>i", group = "Insert" }, { buffer = true })
    wk.add({ "<localleader>c", group = "Code" }, { buffer = true })
    wk.add({ "<localleader>i", group = "Insert" }, { buffer = true })
    wk.add({ "<localleader>l", group = "List" }, { buffer = true })
    wk.add({ "<localleader>n", group = "Note" }, { buffer = true })
    wk.add({ "<localleader>t", group = "Task" }, { buffer = true })
  end,
})
