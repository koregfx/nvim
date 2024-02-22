vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set default term to powershell
vim.o.shell = "pwsh"
-- 'pwsh' /// 'powershell'
vim.o.shellcmdflag = "-command"
vim.o.shellquote = '"'
vim.o.shellxquote = ""

-- enable persistent undo
vim.opt.undofile = true

-- Enable incremental searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Disabling creates a swapfile
vim.opt.swapfile = false

vim.opt.backup = false
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.o.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 1 -- always show tabs

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auro indenting and set it to spaces
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Enable smartindent (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

--Disable text wrap
vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.completeopt = { "menuone", "noselect" }

-- Neovide Config
if vim.g.neovide then
	vim.o.guifont = "CaskaydiaCove Nerd Font"
end
