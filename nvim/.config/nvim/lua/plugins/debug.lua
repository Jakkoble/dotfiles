return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"NicholasMata/nvim-dap-cs",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("dap-cs").setup()
		require("dapui").setup()

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint)
		vim.keymap.set("n", "<Leader>dc", dap.continue)
	end,
}
