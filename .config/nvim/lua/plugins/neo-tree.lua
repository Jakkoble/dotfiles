return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
			close_if_last_window = false,
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						vim.cmd("Neotree close")
					end,
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		},
		keys = {
			{ "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
		},
	},
}
