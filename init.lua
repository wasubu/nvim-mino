vim.keymap.set("i", "<Tab>", "<Tab>", { expr = false }) -- cancel built-in snippet jump
vim.keymap.set("i", "<S-Tab>", "<S-Tab>", { expr = false }) -- cancel built-in snippet jump

vim.keymap.del("i", "<Tab>")
vim.keymap.del("i", "<S-Tab>")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		vim.keymap.set("n", "<Space>", function()
			vim.cmd("Neotree close")
		end, { buffer = true, desc = "Close Neo-tree", noremap = true, silent = true })
	end,
})

--TODO: [ ] Put these to keymap
vim.keymap.set("n", "<Space>", function()
	-- Get current window and buffer info
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local bufname = vim.api.nvim_buf_get_name(buf)

	-- Check if current buffer is a Neo-tree buffer
	local is_neotree = bufname:match("neo%-tree")

	if is_neotree then
		-- Close the Neo-tree window
		vim.cmd("Neotree close")
	else
		-- Reveal the current file in Neo-tree
		vim.cmd("Neotree reveal")
	end
end, { desc = "Toggle Neo-tree reveal or close", noremap = true, silent = true })

local ok, tempmanager = pcall(require, "core.tempmanager")
if ok then
	tempmanager.setup()
end

local function safe_require(module)
	local ok, mod = pcall(require, module)
	if not ok then
		vim.notify("Error loading " .. module .. "\n\n" .. mod, vim.log.levels.ERROR)
	end
	return mod
end

safe_require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- cleans up the old undotree files
local undo = require("core.cleanupUndo")
undo.setup() -- setup undo dir and options
undo.cleanup(120) -- delete undo files older than 60 days

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.theme"),
	require("plugins.lualine"),
	require("plugins.syntax"),
	require("plugins.telescope"),
	require("plugins.lazydev"),
	-- require("plugins.tsserver"),
	require("plugins.lsp"),
	require("plugins.autoformat"),
	require("plugins.autocomplete"),
	require("plugins.neostart"),
	require("plugins.misc"),
	require("plugins.gitsigns"),
	require("plugins.tablines"),
	require("plugins.liveserver"),
	require("plugins.comment"),
	-- require("plugins.enterfix"),
	require("plugins.peek"),
})

vim.cmd([[colorscheme tokyonight]])

-- Safely load core config
local keymaps = safe_require("core.keymaps")
if keymaps and type(keymaps.setup) == "function" then
	keymaps.setup()
end

vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.cindent = true
