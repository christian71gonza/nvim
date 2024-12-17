local C = require("core.utils.chars")
local U = require("core.utils.neovim")

-- Important to place this before loading plugins.
vim.g.mapleader = " "

vim.o.shortmess = 'IcsCFSW'
vim.cmd('hi NonText guifg=bg')
vim.opt.showmode = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.g.have_nerd_font = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 0

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.showtabline = 0
vim.opt.winbar = nil

vim.opt.inccommand = "nosplit"

vim.opt.cmdheight = 1
vim.g.VM_set_statusline = 1
vim.g.VM_silent_exit = 1

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Windows
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.pumheight = 10

-- Theme
vim.opt.background = "dark"

-- Default new window to vertical split (this messes up debugger windows).
-- vim.api.nvim_command('autocmd WinNew * wincmd H')

vim.cmd("filetype plugin indent on")
