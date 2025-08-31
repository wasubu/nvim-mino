return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		-- Show history of changes
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		init = function()
			vim.g.undotree_WindowLayout = 3 -- Tree and diff on right of main window
			vim.g.undotree_SplitWidth = 40 -- Width of undotree window
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_HelpLine = 0 -- Hide help line (optional)
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = "",
				mappings = { basic = true, extra = true, extended = true },
				toggler = { line = "gcc", block = "gbc" },
				opleader = { line = "gc", block = "gb" },
				extra = { above = "gcO", below = "gco", eol = "gcA" },
				pre_hook = function(_)
					return ""
				end,
				post_hook = function(_) end,
			})
		end,
	},
	{
		-- show git signs besides neotree files, put marks code
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "npm install -g live-server",
		config = function()
			require("live-server").setup({
				cmd = "live-server.cmd", -- Windows-friendly executable
			})
		end,
	},
}
