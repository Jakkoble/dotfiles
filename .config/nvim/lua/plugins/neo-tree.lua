return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>")
			require("neo-tree").setup({
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
						hide_gitignored = true,
					},
				},
				window = {
					mappings = {
						["<leader>x"] = {
							function(state)
								local node = state.tree:get_node()
								local filepath = node:get_id()
								vim.cmd("!chmod +x " .. filepath)
								vim.cmd("!" .. filepath)
								vim.cmd("Neotree close")
							end,
							desc = "Execute script",
						},
					},
				},
			})
		end,
	},
}
