-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { nowait = true, desc = "enter command mode" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { nowait = true })
vim.keymap.set("n", "<C-u", "<C-u>zz", { nowait = true })
