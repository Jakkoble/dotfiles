return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			preset = "enter",
		},
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		fuzzy = { implementation = "prefer_rust" },
	},
}
