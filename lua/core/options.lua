local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.wrap = false
opt.linebreak = true
--opt.mouse = "a"
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

vim.o.scrolloff = 4
vim.o.sidescrolloff = 8
vim.opt.termguicolors = true
vim.o.showtabline = 0 -- changed

-- Swap and backup
opt.swapfile = false -- Don't use swapfiles
opt.backup = false -- Don't use backups

-- Persistent undo
local undoFileHolder = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undoFileHolder) == 0 then
	vim.fn.mkdir(undoFileHolder, "p")
end
vim.o.undofile = true -- Enable persistent undo
vim.o.undodir = undoFileHolder

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.inccommand = "split"
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.path:append({ "**" }) -- can you search this online?
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""

--[[ vim.opt.shell = '"C:\\Program Files\\Git\\usr\\bin\\bash.exe"'
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = "" ]]

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.o.shell = "powershell.exe"
	vim.o.shellcmdflag = "-NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.o.shellquote = [["]]
	vim.o.shellxquote = ""
end
