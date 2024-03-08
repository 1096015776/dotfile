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
        "typescript-language-server",
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
  --bookmark
  {
    "tomasky/bookmarks.nvim",
    init = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },
  "LunarVim/bigfile.nvim",
  "sindrets/diffview.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<c-f>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            require("spectre").open({
              open_cmd = "vnew",
              is_insert_mode = true,
              cwd = path,
              search_text = "",
              is_close = false,
            })
          end,
          ["<c-d>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            vim.cmd("DiffviewFileHistory " .. path)
          end,
        },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      size = 12,
      open_mapping = [[<c-t>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      direction = "horizontal",
    },
  },
}
