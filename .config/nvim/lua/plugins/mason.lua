return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP Server
				"lua-language-server",
				"typescript-language-server",
				"phpactor",
				"html-lsp",
				"css-lsp",
				"json-lsp",
				"rust-analyzer",
				"gopls",
				"omnisharp",

				-- Formatter
				"prettierd",
				"stylua",
				"goimports",
				"csharpier",

				-- Linter
				"eslint_d",
			},
		},
	},
}
