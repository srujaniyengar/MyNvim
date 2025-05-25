return {
  { "folke/lazy.nvim", version = "*" },

  {
    "marko-cerovac/material.nvim",
    config = function()
      require("theme").apply()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4) -- 50% width for vertical terminals
          else
            return 15 -- default for horizontal
          end
        end,
        shade_terminals = false,
        direction = "float", -- default, overridden by keymaps for vertical
        start_in_insert = true,
        close_on_exit = false,
      })
    end,
  },

  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-web-devicons" },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    version = "^1.0.0",
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  { "stevearc/conform.nvim", opts = {} },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
}