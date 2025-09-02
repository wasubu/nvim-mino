return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	opts = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Custom highlight group for fold suffix
		vim.api.nvim_set_hl(0, "FoldSuffix", { fg = "#d6a849", bold = true })

		local ufo = require("ufo")
		local bufmanager = require("ufo.bufmanager")

		ufo.setup({
			provider_selector = function(bufnr)
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				if #clients > 0 then
					return { "lsp", "treesitter" }
				else
					return { "treesitter" }
				end
			end,

			open_fold_hl_timeout = 150,
			close_fold_kinds_for_ft = {
				default = { "imports", "comment" },
				lua = { "comment" },
				python = {},
			},

			-- Custom fold text
			fold_virt_text_handler = function(_, lnum, endLnum, width, truncate)
				-- grab exact leading whitespace (so tabs are preserved too)
				local indentStr = vim.fn.getline(lnum):match("^%s*") or ""

				local count = endLnum - lnum + 1
				local line = vim.fn.getline(lnum):gsub("^%s+", "") -- code without indent
				local suffix = (" ▶ %s ... (%d lines)"):format(line, count)

				-- stick indent in front and truncate to width
				local text = indentStr .. suffix
				text = truncate(text, width)

				return { { text, "FoldSuffix" } }
			end,
		})

		local group = vim.api.nvim_create_augroup("AutoSaveFoldsUFO", { clear = true })

		vim.api.nvim_create_autocmd("BufWinLeave", {
			group = group,
			pattern = "*",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local buftype = vim.bo[bufnr].buftype
				if buftype == "terminal" then
					return
				end

				-- Save folds using UFO buffer manager if attached
				local ok, bufo = pcall(bufmanager.get, bufnr)
				if ok and bufo then
					vim.b.ufo_saved_folds = bufo:getFolds()
				end

				-- fallback to mkview
				vim.cmd("silent! mkview")
			end,
		})

		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = group,
			pattern = "*",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local ok, bufo = pcall(bufmanager.get, bufnr)
				if ok and bufo and vim.b.ufo_saved_folds then
					bufo:setFolds(vim.b.ufo_saved_folds)
				end

				vim.cmd("silent! loadview")
			end,
		})
	end,
}
