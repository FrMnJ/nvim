vim.opt_local.shiftwidth = 2

local opts = { buffer = true, silent = true }

vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  vim.cmd("!racket %")
end, opts)
