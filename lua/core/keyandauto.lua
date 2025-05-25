local M = {}

function M.setup()
	-- [[ Basic Keymaps ]]
	vim.keymap.set("n", "<Esc>", function()
		if vim.v.hlsearch == 1 then
			vim.cmd("nohlsearch")
		end
	end, { desc = "Clear search highlight", noremap = true, silent = true })

	--vim.notify("keyandauto setup running", vim.log.levels.INFO)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
	--vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

	vim.keymap.set("n", "<Leader>v", "<Cmd>edit $MYVIMRC<CR>", { desc = "Open init.lua" })
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "ff", builtin.find_files, { desc = "Telescope find_files" })
	vim.keymap.set("n", "fg", builtin.live_grep, { desc = "Telescope live_grep" })
	vim.keymap.set("n", "fb", builtin.buffers, { desc = "Telescope buffers" })
	vim.keymap.set("n", "fh", builtin.help_tags, { desc = "Telescope help_tags" })
	vim.keymap.set("n", "Fb", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })

	-- [[ Autocommands ]]
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})
	--vim.api.nvim_create_user_command("Ut", function()
	--	vim.cmd.UndotreeToggle()
	--end, {})

	--vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
	vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
end

return M
