return {
    "stevearc/overseer.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
    },
    config = function()
        require("overseer").setup({})

        require("dressing").setup({
            select = {
                backend = { "telescope" },
            },
        })

        vim.keymap.set("n", "<leader>tt", "<cmd>OverseerRun<cr>",
            { desc = "Run task" })

        vim.keymap.set("n", "<leader>tl", "<cmd>OverseerToggle<cr>",
            { desc = "Task list" })
    end,
}
