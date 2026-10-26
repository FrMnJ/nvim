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

	    vim.keymap.set("n", "<leader>tf", function() vim.diagnostic.open_float() end)

	    local vue_plugin = {
		name = "@vue/typescript-plugin",
		location = vim.fn.stdpath("config")
		.. "/node_modules/@vue/typescript-plugin",
		languages = { "vue" },
		configNamespace = "typescript",
	    }

	    vim.lsp.config("vtsls", {
		settings = {
		    vtsls = {
			tsserver = {
			    globalPlugins = { vue_plugin },
			},
		    },
		},
		filetypes = {
		    "javascript",
		    "javascriptreact",
		    "typescript",
		    "typescriptreact",
		    "vue",
		},
	    })

	    vim.lsp.enable({
		"lua_ls",
		"php_lsp",
		"vtsls",
		"vue_ls",
	    })
	end,
    }
}
