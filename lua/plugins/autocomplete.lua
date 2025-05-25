return {
	-- Explicitly load `nvim-cmp` to avoid "module 'cmp' not found"
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"windwp/nvim-autopairs",
		},
		config = function()
			-- Setup autopairs integration for `nvim-cmp`
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Blink.cmp autocompletion setup
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			"hrsh7th/nvim-cmp", -- ensure cmp is also loaded
			"windwp/nvim-autopairs",
			"folke/lazydev.nvim",
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- Optional: friendly-snippets
					-- {
					--   "rafamadriz/friendly-snippets",
					--   config = function()
					--     require("luasnip.loaders.from_vscode").lazy_load()
					--   end,
					-- },
				},
				opts = {},
			},
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = "none",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = {
					function(cmp)
						if cmp.is_visible() then
							cmp.accept()
							return true -- stop here, do not run fallback
						end
					end,
					"fallback", -- fallback to native <CR> which preserves auto-indentation
				},
				["<C-e>"] = {}, -- Disable if preset was setting it
				["<Esc>"] = {
					function(cmp)
						if cmp.is_visible() then
							cmp.hide()
							return true
						end
						return false
					end,
					function()
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						return true
					end,
				},
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = {
				preset = "luasnip",
				--[[ keymap = {
					expand = "<nop>",
					jump_next = "<nop>",
					jump_prev = "<nop>",
				}, ]]
			},

			fuzzy = { implementation = "lua" },

			signature = { enabled = true },
		},
		config = function(_, opts)
			-- Setup Blink itself
			require("blink.cmp").setup(opts)
			-- NOTE: Autopairs is now setup in the `nvim-cmp` block, so we don’t repeat it here.
		end,
	},
}
