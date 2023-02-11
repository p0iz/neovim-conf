return {
	setup = function(plugins)
		-- Ensure lazy.nvim is installed
		local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
		if not vim.loop.fs_stat(lazypath) then
			vim.fn.system({
				'git',
				'clone',
				'--filter=blob:none',
				'https://github.com/folke/lazy.nvim.git', lazypath})
		end
		vim.opt.rtp:prepend(lazypath)

		-- Setup Lazy
		return require('lazy').setup(plugins)
	end
}

