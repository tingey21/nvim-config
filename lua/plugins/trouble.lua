return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    modes = {
      lsp = {
        win = { position = "right" },
      },
    },
  },
  keys = {
    { "<leader>dt", "<cmd>Trouble diagnostics toggle<cr>" },
    { "<leader>dT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
    { "<leader>cs", "<cmd>Trouble symbols toggle<cr>" },
    { "<leader>cS", "<cmd>Trouble lsp toggle<cr>" },
    { "<leader>dL", "<cmd>Trouble loclist toggle<cr>" },
    { "<leader>tQ", "<cmd>Trouble qflist toggle<cr>" },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
    },
  },
}
