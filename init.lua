local g = vim.g
local cmd = vim.cmd

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
opt.guifont = 'Press Start 2P:h14'

-- Keybindings
local silent = { silent = true, noremap = true }
local map = vim.api.nvim_set_keymap

-- Save
map('n', '<leader>s', '<cmd>w<cr>', silent)

-- Fast buffer switching
map('n', '<c-w>n', '<cmd>bn<cr>', silent)
map('n', '<c-w>p', '<cmd>bp<cr>', silent)

-- Keep selection when indenting in visual mode
map('v', '<', '<gv', silent)
map('v', '>', '>gv', silent)

-- Tab movement
map('n', '<leader>tt', '<cmd>tabnew<cr>', silent)
map('n', '<leader>tc', '<cmd>tabclose<cr>', silent)
map('n', '<leader>th', '<cmd>tabpre<cr>', silent)
map('n', '<leader>tl', '<cmd>tabnext<cr>', silent)

-- Fast jump to start/end of line
map('n', 'H', '^', silent)
map('v', 'H', '^', silent)
map('n', 'L', '$', silent)
map('v', 'L', '$', silent)

-- Escape from terminal
map('t', '<M-Esc>', [[<C-\><C-n>]], silent)

-- Autocommands for buffers
vim.cmd([[
	augroup BufferMagic
		autocmd!
		autocmd BufEnter * let &titlestring = '[' . expand('%') . ']'
	augroup end
]])
