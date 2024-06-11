-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local map = vim.keymap.set
map("n", "<leader><leader>", "<c-^>")
map({ "n", "v" }, "<localleader>d", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "fileHistory" })

if vim.lsp.inlay_hint then
  vim.keymap.set(
    "n",
    "<leader>uh",
    function ()
      -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      -- vim.lsp.inlay_hint(0,nil)
    end,
    {desc = "Toggle Inlay hint"}
  )
end
