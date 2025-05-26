return {
  { "folke/lazy.nvim", version = "*" },

  -- Theme
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("theme").apply()
    end,
  },

  -- File Explorer with Git integration
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {
        git = {
          enable = true,
          ignore = false,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
            },
          },
        },
      }
    end,
  },

  -- Git signs in buffer (gutter)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        current_line_blame = true,
      }
    end,
  },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Completion framework and sources
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("lsp.cmp")
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          else
            return 15
          end
        end,
        shade_terminals = false,
        direction = "float",
        start_in_insert = true,
        close_on_exit = false,
      }
    end,
  },

  -- Tabs
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
    version = "^1.0.0",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Formatter
  { "stevearc/conform.nvim", opts = {} },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Which-key popup
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
}
