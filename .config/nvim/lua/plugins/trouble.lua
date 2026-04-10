return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Projekt)" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (Buffer)" },
	},
	opts = {},
}
