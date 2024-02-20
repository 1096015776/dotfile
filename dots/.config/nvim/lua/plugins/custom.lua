return {
  --tmux nav
  "alexghergh/nvim-tmux-navigation",
  --theme
  { "navarasu/onedark.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  --git blame
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  --ensure_installed lsp
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "flake8",
        "lua-language-server",
        "shfmt",
        "stylua",
        "vetur-vls",
        "typescript-language-server"
      },
    },
  },
  --embled terminal open file in only one instance
  {
    "samjwill/nvim-unception",
    init = function()
      vim.g.unception_delete_replaced_buffer = true
      vim.g.unception_enable_flavor_text = false
    end,
  },
}
