return {
	-- Other plugins...

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("typescript-tools").setup({
				settings = {
					separate_diagnostic_server = true,
					publish_diagnostic_on = "insert_leave",
					expose_as_code_action = "all",
					tsserver_plugins = {},
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- your mason, mason-lspconfig, etc.
		},
		config = function()
			-- your big config function here
			-- DON'T call require("typescript-tools") here
		end,
	},
}
