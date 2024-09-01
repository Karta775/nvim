local M = {}

M.map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.hidden_map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, hidden = true, desc = desc })
end

M.lsp_map = function(lhs, rhs, bufnr, desc)
	vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

M.dap_map = function(mode, lhs, rhs, desc)
	M.map(mode, lhs, rhs, desc)
end

M.set_leader = function(leader, localleader)
	vim.g.mapleader = leader
	vim.g.maplocalleader = localleader
	M.map({ "n", "v" }, leader, "<nop>")
	M.map({ "n", "v" }, localleader, "<nop>")
end

return M
