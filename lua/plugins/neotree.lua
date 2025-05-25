return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window
	},
	lazy = false,
	keys = {
		{ " ", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		commands = {
			open_in_default_app = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				os.execute('start "" "' .. path .. '"') -- Windows
				-- Use `xdg-open "` .. path .. '"` for Linux
				-- Use `open "' .. path .. '"` for macOS
			end,
			copy_selector = function(state)
				local node = state.tree:get_node()
				local filepath = node:get_id()
				local filename = node.name
				local modify = vim.fn.fnamemodify

				local vals = {
					["BASENAME"] = modify(filename, ":r"),
					["EXTENSION"] = modify(filename, ":e"),
					["FILENAME"] = filename,
					["PATH (CWD)"] = modify(filepath, ":."),
					["PATH (HOME)"] = modify(filepath, ":~"),
					["PATH"] = filepath,
					["URI"] = vim.uri_from_fname(filepath),
				}

				local options = vim.tbl_filter(function(val)
					return vals[val] ~= ""
				end, vim.tbl_keys(vals))

				if vim.tbl_isempty(options) then
					vim.notify("No values to copy", vim.log.levels.WARN)
					return
				end

				table.sort(options)
				vim.ui.select(options, {
					prompt = "Choose to copy to clipboard:",
					format_item = function(item)
						return ("%s: %s"):format(item, vals[item])
					end,
				}, function(choice)
					local result = vals[choice]
					if result then
						vim.notify(("Copied: `%s`"):format(result))
						vim.fn.setreg("+", result)
					end
				end)
			end,
		},

		window = {
			mappings = {
				Y = "copy_selector", -- press Y to trigger the custom command
				I = "open_in_default_app",
			},
			width = 25,
		},

		filesystem = {
			window = {
				mappings = {
					[" "] = "close_window",
				},
			},
		},
	},
}

--[[
local function set_transparent()
	local hl = vim.api.nvim_set_hl
	local groups = {
		"NeoTreeNormal",
		"NeoTreeNormalNC",
		"NeoTreeEndOfBuffer",
		"NeoTreeWinSeparator",
		"NeoTreeFloatBorder",
		"NormalFloat",
		"FloatBorder",
		"WinSeparator",
	}
	for _, group in ipairs(groups) do
		hl(0, group, { bg = "NONE" })
	end
	hl(0, "NeoTreeHidden", { fg = "#777777", italic = true })
	hl(0, "NeoTreeCursorLine", { bg = "NONE", underline = true })
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- or true if you want lazy loading
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		-- your opts here
	},
	config = function()
		set_transparent()
	end,
}
--]]
