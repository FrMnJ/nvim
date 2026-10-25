vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  vim.cmd("!node %")
end, opts)
