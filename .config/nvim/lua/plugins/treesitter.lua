return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
			ensure_installed = {
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"lua",
				"json",
				"markdown",
				"rust",
				"go",
				"c_sharp",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
