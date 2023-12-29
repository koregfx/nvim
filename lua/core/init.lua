local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.mouse = "a"

opt.signcolumn = "yes"

opt.termguicolors = true
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false

opt.smartindent = true

opt.incsearch = true

opt.scrolloff = 8

opt.updatetime = 50

require("core.keymaps")
