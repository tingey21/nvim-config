-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("Comment").setup()
vim.opt.wrap = true
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = function(lines)
      local text = table.concat(lines, '\n')
      local encoded = vim.fn.system('printf %s ' .. vim.fn.shellescape(text) .. ' | base64 -w0')
      -- Remove any trailing newline from base64 output
      encoded = string.gsub(encoded, '\n$', '')
      io.write('\027]52;c;' .. encoded .. '\027\\')
      io.flush()
    end,
    ['*'] = function(lines)
      local text = table.concat(lines, '\n')
      local encoded = vim.fn.system('printf %s ' .. vim.fn.shellescape(text) .. ' | base64 -w0')
      encoded = string.gsub(encoded, '\n$', '')
      io.write('\027]52;c;' .. encoded .. '\027\\')
      io.flush()
    end,
  },
  paste = {
    ['+'] = function() return {} end,
    ['*'] = function() return {} end,
  },
}

vim.opt.clipboard = "unnamedplus"
vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
vim.keymap.set({ 'n', 'v' }, 'Y', '"+Y')
vim.keymap.set('n', 'yy', '"+yy')

require("focus").setup()
require("lspconfig").omnisharp.setup({
  cmd = { "dotnet", "/Users/master/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp.dll" },
})
