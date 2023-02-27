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
	-- automatocally switch to project/git root directory
	{ 'airblade/vim-rooter' },
	-- mkdir - automatically create missing directories on write
	{ 'jghauser/mkdir.nvim' },

	-- Telescope & co
	{
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup{
				defaults = {
					-- Default configuration for telescope goes here:
					-- config_key = value,
					mappings = {
						i = {
							-- map actions.which_key to <C-h> (default: <C-/>)
							-- actions.which_key shows the mappings for your picker,
							-- e.g. git_{create, delete, ...}_branch for the git_branches picker
							["<C-h>"] = "which_key"
						}
					}
				},
				pickers = {
					-- Default configuration for builtin pickers goes here:
					find_files = {
						hidden = true,
						file_ignore_patterns = { "node_modules", ".git/" }
					}
				},
			}
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'cljoly/telescope-repo.nvim',
		requires = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require("telescope").load_extension "repo"
			vim.keymap.set('n', '<leader>fr', require'telescope'.extensions.repo.list, {})
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

