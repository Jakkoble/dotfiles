return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason.nvim" },
		lazy = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.keymap.set("n", "<leader>dd", function()
				vim.diagnostic.open_float(nil, { focus = true })
			end, { desc = "Line diagnostics" })
		end,
	},
}
