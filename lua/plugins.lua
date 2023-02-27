-- Plugin Spec
return {
	-- CMake Tools
	{
		'Civitasv/cmake-tools.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- File browsing
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_insensitive",
				view = {
					width = 40,
					mappings = {
						list = {
							{ key = "u", action = "dir_up" },
							{ key = ".", action = "cd" },
						},
					},
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
			local api = require("nvim-tree.api")
			vim.keymap.set('n', '<leader>ft', api.tree.toggle, { silent = true })
		end
	},
	{
		'nvim-telescope/telescope.nvim',
	  requires = { 'nvim-lua/plenary.nvim'},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'Hoffs/omnisharp-extended-lsp.nvim'
		},
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup()
			local omnisharp_opts = {
				handlers = {
					["textDocument/definition"] = require('omnisharp_extended').handler,
				},
				sdk_include_prereleases = true
			}
			require('lspconfig').omnisharp.setup(omnisharp_opts)

			-- Go to definition
			vim.keymap.set('n', 'gd', require('omnisharp_extended').lsp_definitions)
		end
	},
	-- Rust
	{
		'simrat39/rust-tools.nvim',
		dependencies = {
			'neovim/nvim-lspconfig'
		},
		config = function()
			local rt = require("rust-tools") 
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end
	},

	-- Color schemes
	{
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	},
	'sainnhe/gruvbox-material'
}

