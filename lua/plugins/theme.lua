return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm", -- "storm", "night", "day"
		transparent = true, -- Enable transparent background
		terminal_colors = true, -- Configure the terminal colors
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "transparent", -- For sidebar like NvimTree or Neo-tree
			floats = "transparent", -- For floating windows
		},
		sidebars = { "qf", "help", "terminal", "neo-tree" }, -- Set sidebar windows to transparent
		-- You can add more options here if you want
		floats = "transparent",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])

		-- Optional: Make the background transparent explicitly for certain highlight groups
		vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi StatusLine guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi Folded guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi Pmenu guibg=NONE ctermbg=NONE
      hi TelescopeNormal guibg=NONE
      hi TelescopeBorder guibg=NONE
    ]])
	end,
}
