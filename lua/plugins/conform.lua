return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  cmd = "ConformInfo",
  event = "BufWritePre",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ force = true, timeout_ms = 3000 })
      end,
      mode = { "n", "x" },
    },
  },
  config = function()
    require("conform").setup({
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "gofmt" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        sh = { "shfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    })
  end,
}
