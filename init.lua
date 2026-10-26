require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {})
vim.keymap.set("n", "<space>x", ":.lua<CR>", {})
vim.keymap.set("v", "<space>x", ":lua<CR>", {})
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {})
vim.keymap.set("n", "<space>s", "<cmd>write<CR>", { silent = true })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})
