vim.g.mapleader = " "
require("lazy").setup("plugins")
require("options") -- If you have one
require("plugins")
require("keymaps")
require("lsp") -- assuming your lsp files are in lua/lsp/init.lua etc.

pcall(require, "lsp") -- will not error if not present
