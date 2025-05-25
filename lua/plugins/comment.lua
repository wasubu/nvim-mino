-- lua/plugins/comment.lua
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- lazy-load on file open
	config = function()
		require("Comment").setup({
			-- Add your custom config here if needed
			-- You can hook into pre/post comment actions as well
		})
	end,
}
