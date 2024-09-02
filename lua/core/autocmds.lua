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

vim.api.nvim_create_autocmd("FileType", {
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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local lsp_map = require("helpers.keys").lsp_map

		lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
		lsp_map("<leader>lR", vim.lsp.buf.references, bufnr, "References")
		lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
		lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")
		lsp_map("<leader>lf", ":lua vim.lsp.buf.format()<CR>", bufnr, "Format file")
		lsp_map("<space>ll", ":Telescope diagnostics<cr>", bufnr, "Search diagnostics")
		lsp_map("<space>lq", vim.diagnostic.setloclist, bufnr, "Location list")
		lsp_map("<leader>lD", vim.lsp.buf.declaration, bufnr, "Go to declaration")
		lsp_map("<leader>ld", vim.lsp.buf.definition, bufnr, "Go to definition")
		lsp_map("<leader>li", vim.lsp.buf.implementation, bufnr, "Implementation")
		lsp_map("<leader>lh", vim.lsp.buf.signature_help, bufnr, "Signature help")
		lsp_map("<leader>lH", vim.lsp.buf.hover, bufnr, "Hover")
		lsp_map("<leader>lwa", vim.lsp.buf.add_workspace_folder, bufnr, "Add folder")
		lsp_map("<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufnr, "Remove folder")
		lsp_map("<leader>lwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufnr, "List folders")
		lsp_map("<leader>lt", vim.lsp.buf.type_definition, bufnr, "Go to type definition")
		lsp_map("<leader>lc", vim.lsp.buf.code_action, bufnr, "Code action")

		lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
		lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
		lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
		lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
		lsp_map("gx", vim.diagnostic.open_float, bufnr, "Show diagnostics under cursor")
		lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")

		lsp_map("[d", vim.diagnostic.goto_prev, bufnr, "Previous LSP diagnostic")
		lsp_map("]d", vim.diagnostic.goto_next, bufnr, "Next LSP diagnostic")

		-- Attach and configure vim-illuminate
		require("illuminate").on_attach(client)
	end,
})
