return {
	{
		"echasnovski/mini.nvim",
		lazy = false,
		version = false,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
		config = function()
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.diff").setup()
			require("mini.git").setup()
			require("mini.icons").setup()
			require("mini.jump").setup()
			require("mini.move").setup()
			require("mini.operators").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
			require("mini.tabline").setup()

			require("mini.sessions").setup({
				autoread = false,
				autowrite = true,
				directory = vim.env.HOME .. "/.local/share/nvim/session",
			})

			require("mini.jump2d").setup({
				mappings = {
					start_jumping = "s",
				},
			})

			require("mini.indentscope").setup({
				draw = {
					delay = 100,
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = "│",
			})

			require("mini.completion").setup()
			local imap_expr = function(lhs, rhs)
				vim.keymap.set("i", lhs, rhs, { expr = true })
			end
			imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
			imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

			local notify = require("mini.notify")
			notify.setup({
				lsp_progress = {
					enable = false,
				},
			})
			-- vim.notify = notify.make_notify()
		end,
	},
	{ -- Has its own spec for the event
		"echasnovski/mini.statusline",
		version = false,
		opts = {},
		event = "VeryLazy",
	},
}
