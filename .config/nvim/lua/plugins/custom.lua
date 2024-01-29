-- if true then return {} end

return {
  --tmux nav
  "alexghergh/nvim-tmux-navigation",
  -- add gruvbox
  { "navarasu/onedark.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
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
      },
    },
  },
}
