vim.g.mapleader = " "

local map = vim.keymap.set

-- ─────────────────────────────────────────
-- NvimTree (File explorer)
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer", noremap = true, silent = true })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer", noremap = true, silent = true })

-- ─────────────────────────────────────────
-- Move between splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up split" })

-- ─────────────────────────────────────────
-- NvimTree specific remap
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true, desc = "Move to file from tree" })
  end,
})

-- ─────────────────────────────────────────
-- Terminal navigation
for _, key in ipairs({ "h", "j", "k", "l" }) do
  vim.api.nvim_set_keymap("t", "<C-" .. key .. ">", [[<C-\><C-n><C-w>]] .. key .. [[i]], { noremap = true, silent = true })
end
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal: Escape terminal mode" })

-- ─────────────────────────────────────────
-- ToggleTerm
map("n", "<leader>tv", function()
  require("toggleterm.terminal").Terminal
    :new({ direction = "vertical", size = math.floor(vim.o.columns * 0.5), close_on_exit = false, start_in_insert = true })
    :toggle()
end, { desc = "Open vertical terminal beside file" })

map({ "n", "t" }, "<A-v>", function()
  require("toggleterm.terminal").Terminal
    :new({ direction = "vertical", size = math.floor(vim.o.columns * 0.5), close_on_exit = false, start_in_insert = true })
    :toggle()
end, { desc = "Vertical terminal (large)" })

map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map({ "n", "t" }, "<A-i>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating terminal" })
map({ "n", "t" }, "<A-h>", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })

-- ─────────────────────────────────────────
-- Buffer navigation (Barbar)
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
map("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", { noremap = true, silent = true })
  map("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", { noremap = true, silent = true })
end
map("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })

-- ─────────────────────────────────────────
-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep files" })

-- ─────────────────────────────────────────
-- Comments
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- ─────────────────────────────────────────
-- General
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- ─────────────────────────────────────────
-- Format
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- ─────────────────────────────────────────
-- LSP diagnostics
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- ─────────────────────────────────────────
-- Buffers
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })

-- ─────────────────────────────────────────
-- Tabs (native)
map("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Tab next" })
map("n", "<S-Tab>", ":tabprev<CR>", { noremap = true, silent = true, desc = "Tab prev" })
map("n", "<leader>tn", ":tabnew<CR>", { noremap = true, desc = "Tab new" })
map("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "Tab close" })
map("n", "<leader><Tab>", ":tablast<CR>", { noremap = true, silent = true, desc = "Go to last tab" })

-- ─────────────────────────────────────────
-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "WhichKey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "WhichKey query lookup" })

-- ─────────────────────────────────────────
-- 📋 Clipboard Support
-- Safer alternative: <leader>y/p for clipboard operations
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })
