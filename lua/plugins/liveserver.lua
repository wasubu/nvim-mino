return {
	"barrett-ruth/live-server.nvim",
	build = "npm install -g live-server",
	config = function()
		require("live-server").setup({
			cmd = "live-server.cmd", -- Windows-friendly executable
		})

		vim.keymap.set("n", "<leader>ls", function()
			local dir = vim.fn.expand("%:p:h")
			if dir == "" then
				vim.notify("live-server.nvim: No directory found for current file", vim.log.levels.ERROR)
				return
			end
			require("live-server").start(dir)
		end, { desc = "Start Live Server" })

		vim.keymap.set("n", "<leader>lx", function()
			local dir = vim.fn.expand("%:p:h")
			if dir == "" then
				vim.notify("live-server.nvim: No directory found for current file", vim.log.levels.ERROR)
				return
			end
			require("live-server").stop(dir)
		end, { desc = "Stop Live Server" })
	end,
}
