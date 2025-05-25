return {
	"hrsh7th/nvim-cmp",
	dependencies = { "windwp/nvim-autopairs" },
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
