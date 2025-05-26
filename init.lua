vim.g.mapleader = " "
require("lazy").setup("plugins")
require("options") -- If you have one
require("plugins")
require("keymaps")
pcall(require, "lsp") -- will not error if not present
