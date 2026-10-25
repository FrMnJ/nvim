return {
    {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
	    require('telescope').setup {
		pickers = {
		    find_files = {
			theme = 'dropdown',
		    },
		    lsp_references = {
			theme = 'dropdown',
		    },
		    buffers = {
			theme = 'dropdown',
		    },
		    live_grep = {
			theme = 'dropdown',
		    },
		},
	    }
	    vim.keymap.set('n', '<space>ff', require('telescope.builtin').find_files)
	    vim.keymap.set('n', "<space>fc", function()
		require('telescope.builtin').find_files {
		    cwd = vim.fn.stdpath("config")
		}
	    end)
	    vim.keymap.set('n', '<space>fr', require('telescope.builtin').lsp_references)
	    vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers)
	    vim.keymap.set('n', '<space>fg', require('telescope.builtin').live_grep)
	    vim.keymap.set('n', '<space>fh', require('telescope.builtin').help_tags)
	end
    },
}
