local M = {}

function M.setup()
	local win_temp = vim.fn.expand("$TEMP")
	if win_temp == "" or win_temp == nil then
		win_temp = "C:\\Users\\delma\\AppData\\Local\\Temp"
	end

	vim.env.TEMP = win_temp
	vim.env.TMP = win_temp
	vim.env.TMPDIR = win_temp

	vim.o.directory = win_temp -- swap files
	vim.o.undodir = win_temp -- undo files (if using undofile)
	vim.o.backupdir = win_temp -- backup files
end

return M
