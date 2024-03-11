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
          ["<c-e>"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_parent_id()
            if node.type == "directory" then
              path = node:get_id()
            end
            require("neo-tree").close_all()
            local term_opts = { cwd = path, esc_esc = false, ctrl_hjkl = false, border = "single" }
            local Util = require("lazyvim.util")
            Util.terminal({ "zsh", "-c", "cd " .. path .. " && ranger" }, term_opts)
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
    "folke/edgy.nvim",
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { height = 0.4 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
          "Trouble",
          {
            ft = "trouble",
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          -- { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {
          {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            pinned = true,
            open = function()
              vim.api.nvim_input("<esc><space>e")
            end,
            size = { height = 0.5 },
          },
          { title = "Neotest Summary", ft = "neotest-summary" },
          {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
          },
          {
            title = "Neo-Tree Buffers",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "buffers"
            end,
            pinned = true,
            open = "Neotree position=top buffers",
          },
          "neo-tree",
        },
        -- right = {
        --   { title = "Spectre", ft = "spectre_panel", size = { height = 0.4, width = 0.4 } },
        -- },
        keys = {
          -- increase width
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }
      return opts
    end,
  },
  "folke/zen-mode.nvim",
}
