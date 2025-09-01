local M = {}

local function keyBind_rr()
	vim.keymap.set("n", "<leader>rr", function()
		local ft = vim.bo.filetype
		local file = vim.fn.expand("%:p")
		local dir = vim.fn.expand("%:p:h")

		if ft == "python" then
			vim.cmd('botright split | terminal python "' .. file .. '"')
		elseif ft == "html" or ft == "javascript" then
			if dir == "" then
				vim.notify("live-server.nvim: No directory found for current file", vim.log.levels.ERROR)
				return
			end
			if not pcall(require, "live-server") then
				vim.notify("live-server.nvim is not installed!", vim.log.levels.ERROR)
				return
			end
			require("live-server").toggle(dir)
		else
			vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
		end
	end, { desc = "Run current file or toggle live-server" })
end

local function keyBind_telescope()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
	vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
end

local function keyBind_moveWindows()
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
end

local function keyBind_unselect()
	vim.keymap.set("n", "<Esc>", function()
		if vim.v.hlsearch == 1 then
			vim.cmd("nohlsearch")
		end
	end, { desc = "Clear search highlight", noremap = true, silent = true })
end

local function keyBind_changeSizeBuffer()
	-- Resize splits using Ctrl + Arrow keys
	vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
	vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
	vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { desc = "Decrease window width" })
	vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { desc = "Increase window width" })
end

local function keyBind_foldByHL()
	vim.keymap.set("n", "h", "zc", { noremap = true, silent = true })
	vim.keymap.set("n", "l", "zo", { noremap = true, silent = true })
end

local function auto_flashYank()
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})
end

local function auto_saveFolds()
	-- Save folds automatically (only for "real" files, skip terminals / unsafe names)
	vim.api.nvim_create_autocmd("BufWinLeave", {
		pattern = "*",
		callback = function()
			local name = vim.api.nvim_buf_get_name(0)
			-- Skip if terminal buffer or name has illegal Windows characters
			if name:match("^term://") or name:match('[":=*?<>|]') then
				return
			end
			if vim.fn.expand("%") ~= "" then
				vim.cmd("mkview")
			end
		end,
	})
	-- Load folds automatically (only for "real" files)
	vim.api.nvim_create_autocmd("BufWinEnter", {
		pattern = "*",
		callback = function()
			local name = vim.api.nvim_buf_get_name(0)
			if name:match("^term://") or name:match('[":=*?<>|]') then
				return
			end
			if vim.fn.expand("%") ~= "" then
				vim.cmd("silent! loadview")
			end
		end,
	})
end

local function keyBind_other()
	vim.keymap.set("n", "<Leader>v", "<Cmd>edit $MYVIMRC<CR>", { desc = "Open init.lua" })
	vim.keymap.set("n", "h", "<Nop>")
	vim.keymap.set("n", "l", "<Nop>")
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "LSP Rename" })
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
	vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
end

function M.setup()
	-- [[ Basic Keymaps ]]
	keyBind_other() -- look above
	keyBind_unselect() -- press Esc to unselect text
	keyBind_telescope() -- ff, fb, fh, Fb
	keyBind_moveWindows()
	keyBind_rr()
	keyBind_changeSizeBuffer()
	keyBind_foldByHL()

	-- [[ Autocommands ]]
	auto_flashYank()
	auto_saveFolds()
end

return M
