return {
	{
		"nvim-neorg/neorg",
		event = "VeryLazy",
		version = "*",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-neorg/neorg-telescope" },
		},
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.summary"] = {
						config = {
							strategy = "by_path"
						}
					},
					["core.integrations.telescope"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Documents/neorg/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},
}
