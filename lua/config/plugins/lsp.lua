return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		    library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		    },
		},
	    },
	},
	config = function()
	    vim.diagnostic.config({
		virtual_lines = true,
	    })

	    vim.keymap.set("n", "<C-t>", function() vim.diagnostic.open_float() end)

	    vim.lsp.enable('lua_ls')
	    vim.lsp.enable('ts_ls')
	    vim.lsp.enable('php_lsp')
	end,
    }
}
