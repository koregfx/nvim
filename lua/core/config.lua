vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set default term to powershell
vim.o.shell = "powershell" 
-- 'pwsh' /// 'powershell'
vim.o.shellcmdflag = "-command"
vim.o.shellquote = '"'
vim.o.shellxquote = ""

vim.opt.undofile = true -- enable persistent undo

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false -- creates a swapfile
vim.opt.backup = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.o.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 1 -- always show tabs
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8


vim.opt.updatetime = 50

vim.opt.completeopt = { "menuone", "noselect" }
