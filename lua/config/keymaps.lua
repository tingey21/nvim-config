-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { nowait = true })
vim.keymap.set("n", "<C-u", "<C-u>zz", { nowait = true })
vim.keymap.set("n", "{", "{zz", { nowait = true })
vim.keymap.set("n", "}", "}zz", { nowait = true })
vim.keymap.set("n", "<TAB>", ":lua GoToNextOrFirstBuffer()<CR>", { desc = "Next Buffer", nowait = true, silent = true })

vim.keymap.set(
  "n",
  "<S-TAB>",
  ":lua GoToPrevOrLastBuffer()<CR>",
  { desc = "Prev Buffer", nowait = true, silent = true }
)

function GoToNextOrFirstBuffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local last_buffer = vim.api.nvim_buf_get_number(vim.api.nvim_list_bufs()[#vim.api.nvim_list_bufs()])
  if current_buffer == last_buffer then
    vim.cmd("bfirst")
  else
    vim.cmd("bnext")
  end
end

function GoToPrevOrLastBuffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local first_buffer = vim.api.nvim_buf_get_number(vim.api.nvim_list_bufs()[1])
  if current_buffer == first_buffer then
    vim.cmd("blast")
  else
    vim.cmd("bprev")
  end
end
