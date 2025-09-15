-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
--#regiona
vim.cmd(
  [[
autocmd BufNewFile,BufRead Tiltfile* setlocal ft=tiltfile syntax=starlark
  ]]
)
vim.filetype.add({
  extension = {
    gotmpl = "helm",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.yml"] = "helm",
    ["helmfile.*%.yaml"] = "helm",
  },
})
