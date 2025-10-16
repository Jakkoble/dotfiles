local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "cssls", "html", "jsonls", "tailwindcss" },
			handlers = {
				function(server_name)
					vim.lsp.config(server_name, { capabilities = cmp_caps })
					vim.lsp.enable(server_name)
				end,
			},
		},
		config = {
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = ev.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 1000 })
						end,
					})
				end,
			}),

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			}),

			vim.lsp.config("kotlin_language_server", {
				init_options = { storagePath = vim.fn.stdpath("cache") .. "/kotlin_language_server" },
			}),
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					registries = {
						"github:mason-org/mason-registry",
						"github:Crashdummyy/mason-registry",
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"seblyng/roslyn.nvim",
	},
}
