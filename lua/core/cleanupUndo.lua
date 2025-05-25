local M = {}

local uv = vim.loop

local function get_undodir()
	local base = vim.fn.stdpath("data") -- changed here!
	if base and base ~= "" then
		return base .. "/undo"
	else
		return vim.fn.stdpath("config") .. "/undo"
	end
end

local undodir = get_undodir()

local function ensure_undodir()
	if vim.fn.isdirectory(undodir) == 0 then
		local ok, err = pcall(vim.fn.mkdir, undodir, "p")
		if not ok then
			vim.notify("Failed to create undo directory: " .. tostring(err), vim.log.levels.ERROR)
		end
	end
end

local function cleanup_old_files(days)
	days = days or 60
	local now = os.time()
	local threshold = days * 24 * 60 * 60

	local handle = uv.fs_scandir(undodir)
	if not handle then
		return
	end

	while true do
		local name, type = uv.fs_scandir_next(handle)
		if not name then
			break
		end
		if type == "file" then
			local filepath = undodir .. "/" .. name
			local stat = uv.fs_stat(filepath)
			if stat and (now - stat.mtime.sec) > threshold then
				uv.fs_unlink(filepath)
				-- Optional: notify about deletion
				-- vim.notify("Deleted old undo file: " .. filepath)
			end
		end
	end
end

function M.setup()
	ensure_undodir()
	vim.opt.undodir = undodir
	vim.opt.undofile = true
end

function M.cleanup(days)
	cleanup_old_files(days)
end

return M
