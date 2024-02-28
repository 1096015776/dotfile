-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")
map("i", "jk", "<esc>")
-- map("v", "<c-c>", '"*y')
vim.api.nvim_set_keymap("v", "<c-c>", [["+y :call system('clip.exe', @+)<cr>]], { noremap = true, silent = true })

-- tmux
local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- use ranger open file
map("n", "<localleader>e", function()
  Util.terminal({ "ranger" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "single" })
end, { desc = "ranger" })
map("n", "<localleader>g", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "single" })
end, { desc = "lazygit" })
map("n", "<leader>%", "<c-w>v", { desc = "| window" })
map("n", '<leader>"', "<c-w>s", { desc = "- window" })
map("n", "<localleader>q", "<c-w>q", { desc = "close window" })
--bookmark map
map("n", "mm", require("bookmarks").bookmark_toggle, { desc = "bookmark toggle" })
map("n", "mi", require("bookmarks").bookmark_ann, { desc = "bookmark annonte" })
map("n", "mc", require("bookmarks").bookmark_clean, { desc = "bookmark clean" }) -- clean all marks in local buffer
map("n", "mn", require("bookmarks").bookmark_next, { desc = "bookmark next" }) -- jump to next mark in local buffer
map("n", "mp", require("bookmarks").bookmark_prev, { desc = "bookmark prev" }) -- jump to previous mark in local buffer
map("n", "ml", require("bookmarks").bookmark_list, { desc = "bookmark list" }) -- show marked file list in quickfix window
map("n", "<leader>m", ":Telescope bookmarks list<cr>", { desc = "bookmark telescope" }) -- show marked file list in quickfix window
