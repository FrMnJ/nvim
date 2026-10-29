return {
    {
	"github/copilot.vim",
	config = function ()
	    vim.g.copilot_no_tab_map = true
	    vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-word)')
	end
    },
}
