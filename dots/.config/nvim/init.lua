-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local map = vim.keymap.set
map('n','<leader><leader>','<c-^>')
map('n','<localleader><localleader>',":ToggleTerm<cr>")
map('n','<localleader>d',":DiffviewFileHistory %<cr>")
