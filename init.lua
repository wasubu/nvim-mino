local function safe_require(module)
	local ok, mod = pcall(require, module)
	if ok then
		return mod
	else
		vim.notify("Error loading " .. module .. "\n\n" .. mod, vim.log.levels.ERROR)
		return nil
	end
end

local function runPlugins()
	require("lazy").setup({
		require("plugins.neotree"),
		require("plugins.theme"),
		require("plugins.lualine"),
		require("plugins.syntax"),
		require("plugins.telescope"),
		require("plugins.lazydev"),
		require("plugins.lsp"),
		require("plugins.autoformat"),
		require("plugins.autocomplete"),
		require("plugins.neostart"),
		require("plugins.misc"),
		require("plugins.gitsigns"),
		require("plugins.tablines"),
		require("plugins.liveserver"),
		require("plugins.comment"),
		require("plugins.peek"),
	})
end

local function openCloseTree()
	vim.keymap.set("n", "<Space>", "<cmd>Neotree toggle reveal<CR>", {
		desc = "Toggle Neo-tree reveal",
		noremap = true,
		silent = true,
	})
end

local function setTabToDefault()
	vim.keymap.set("i", "<Tab>", "<Tab>", { expr = false }) -- cancel built-in snippet jump
	vim.keymap.set("i", "<S-Tab>", "<S-Tab>", { expr = false }) -- cancel built-in snippet jump
	vim.keymap.del("i", "<Tab>")
	vim.keymap.del("i", "<S-Tab>")
end

local function cleanOldUndoFiles()
	-- cleans up the old undotree files
	local undo = require("core.cleanupUndo")
	undo.setup() -- setup undo dir and options
	undo.cleanup(120) -- delete undo files older than 60 days
end

local function loadKeymaps()
	-- Safely load core config
	local keymaps = safe_require("core.keymaps")
	if keymaps and type(keymaps.setup) == "function" then
		keymaps.setup()
	end
end

local function tempManager()
	local ok, tempmanager = pcall(require, "core.tempmanager")
	if ok then
		tempmanager.setup()
	end
end

local function setupLazy()
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
end

local function loadTheme()
	vim.cmd([[colorscheme tokyonight]])
end

local function runCodes()
	setTabToDefault()
	tempManager()
	safe_require("core.options")
	setupLazy()
	cleanOldUndoFiles()
	runPlugins()
	loadTheme()
	loadKeymaps()
	openCloseTree()
end

runCodes()
