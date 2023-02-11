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
		dependencies = { 'nvim-tree/nvim-web-devicons' } 
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

	-- Color schemes
	{
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	},
	'sainnhe/gruvbox-material'
}

