return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"folke/trouble.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

		require("telescope").setup({
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown({}),
			},
			defaults = {
				mappings = {
					i = { ["<ESC>"] = require("telescope.actions").close },
				},
				file_ignore_patterns = {
					"node_modules/",
					"dist/",
					"%.git/",
					"build/",
					"%.next",
					"yarn%.lock",
					"package%-lock%.json",
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
