local opt = vim.opt

-- Display
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.wrap = false
opt.linebreak = true
opt.termguicolors = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.title = true
opt.showtabline = 0
opt.showcmd = true
opt.hlsearch = true
opt.inccommand = "split"

-- Indentation
opt.smartindent = true
opt.cindent = true
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.backspace = { "start", "eol", "indent" }

-- File handling
opt.autoread = true
opt.autowrite = false

-- Word handling
opt.iskeyword:append("-")

-- Swap / backup
opt.swapfile = false
opt.backup = false

-- Persistent undo
local undoFileHolder = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undoFileHolder) == 0 then
	vim.fn.mkdir(undoFileHolder, "p")
end
opt.undofile = true
opt.undodir = undoFileHolder

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Search / path
opt.path:append({ "**" }) -- recursive search
opt.wildignore:append({ "*/node_modules/*" })

-- Splits / mouse
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"
opt.mouse = ""

-- apearance
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP hover with rounded border" })

-- -- Folding
-- opt.foldmethod = "expr" -- or "expr" for treesitter
-- opt.foldlevel = 99 -- open most folds by default
-- opt.foldenable = true
-- opt.foldtext = "v:lua.MyFoldText()"
-- opt.fillchars = { fold = " " } -- no trailing dots
--
-- -- Custom fold text
-- if _G.MyFoldText == nil then
-- 	function _G.MyFoldText()
-- 		local line = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
-- 		local count = vim.v.foldend - vim.v.foldstart + 1
-- 		return "▶ " .. line .. " ... (" .. count .. " lines)"
-- 	end
-- end

-- Shell config for Windows
vim.opt.shell = "cmd.exe"
vim.opt.shellcmdflag = "/c"
vim.opt.shellredir = ">%s 2>&1"
vim.opt.shellpipe = "| tee"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- [[ Use this if you want the terminal to be powershell]]
-- if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
-- 	vim.o.shell = "powershell.exe"
-- 	vim.o.shellcmdflag = "-NoProfile -ExecutionPolicy RemoteSigned -Command"
-- 	vim.o.shellquote = [["]]
-- 	vim.o.shellxquote = ""
-- end
