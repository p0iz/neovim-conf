local g = vim.g
local cmd = vim.cmd

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Options
local opt = vim.opt
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.guifont = 'ShureTechMono Nerd Font:h16'
opt.title = true

-- Keybindings
local silent = { silent = true, noremap = true }

-- Save
vim.keymap.set('n', '<leader>s', '<cmd>w<cr>', silent)

-- Fast buffer switching
vim.keymap.set('n', '<c-w>n', '<cmd>bn<cr>', silent)
vim.keymap.set('n', '<c-w>p', '<cmd>bp<cr>', silent)

-- Keep selection when indenting in visual mode
vim.keymap.set('v', '<', '<gv', silent)
vim.keymap.set('v', '>', '>gv', silent)

-- Tab movement
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', silent)
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', silent)
vim.keymap.set('n', '<leader>th', '<cmd>tabpre<cr>', silent)
vim.keymap.set('n', '<leader>tl', '<cmd>tabnext<cr>', silent)

-- Fast jump to start/end of line
vim.keymap.set({'n', 'v'}, 'H', '^', silent)
vim.keymap.set({'n', 'v'}, 'L', '$', silent)

-- Escape from terminal
vim.keymap.set('t', '<M-Esc>', [[<C-\><C-n>]], silent)

-- Common LSP magic
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- Autocommands for buffers
vim.cmd([[
	function! UpdateBuffer()
		let &titlestring = '[' . expand('%:p') . ']'
	endfunction
	augroup MyBufferAutomation
		autocmd BufEnter * if filereadable(@%) | call UpdateBuffer() | endif
	augroup end
]])

-- Lazy.nvim setup
require("lazy_setup").setup("plugins")
