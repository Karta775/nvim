local M = {}

M.JavaNewClass = function()
  local path_to_current = vim.fn.expand("%:P"):gsub("([A-Z])%w+.*", "")
  local file_type = vim.bo.filetype

  if file_type ~= "java" then
    vim.notify("You need to run this command from a Java class")
  else
    vim.ui.input({ prompt = "Create Java class", default = path_to_current, completion = "file" }, function(input)
      local with_extension = input:gsub("%.java%s*$", "") .. ".java"
      vim.cmd("edit " .. with_extension)
    end)
  end
end

vim.api.nvim_create_user_command("JavaNewClass", M.JavaNewClass, {})

return M
