-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- map({ "n", "v" }, "H", "^")
-- map({ "n", "v" }, "L", "g_")
map("i", "jk", "<esc>")
map("v", "<c-c>", '"*y')

-- tmux
local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
