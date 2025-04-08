-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("Comment").setup()
vim.opt.wrap = true

require("focus").setup()
require("lspconfig").omnisharp.setup({
  cmd = { "dotnet", "/Users/master/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp.dll" },
})
