local M = {}

function M.apply()
  require("material").setup({
    contrast = {
      terminal = false,
      sidebars = false,
      floating_windows = false,
      cursor_line = false,
      lsp_virtual_text = false,
      non_current_windows = false,
      filetypes = {},
    },
    styles = {
      comments = { italic = true },
    },
    plugins = {
      "eyeliner", "gitsigns", "illuminate", "indent-blankline", "mini",
      "nvim-cmp", "nvim-navic", "nvim-tree", "nvim-web-devicons", "telescope", "which-key",
    },
    disable = {
      colored_cursor = false,
      borders = false,
      background = true,
      term_colors = true,
      eob_lines = true,
    },
    high_visibility = { lighter = false, darker = false },
    lualine_style = "default",
    async_loading = true,
    custom_colors = nil,
    custom_highlights = {},
  })

  vim.g.material_style = "deep ocean"
  vim.cmd("colorscheme material")

  -- Transparency and highlight tweaks
  local hl = vim.api.nvim_set_hl
  hl(0, "Normal",        { bg = "NONE", fg = "#c8d3f5" })
  hl(0, "NormalNC",      { bg = "NONE" })
  hl(0, "NormalFloat",   { bg = "NONE" })
  hl(0, "FloatBorder",   { bg = "NONE" })
  hl(0, "TelescopeNormal", { bg = "NONE" })
  hl(0, "TelescopeBorder", { bg = "NONE" })
  hl(0, "NvimTreeNormal", { bg = "NONE" })
  hl(0, "NvimTreeNormalNC", { bg = "NONE" })
  hl(0, "LineNr",        { fg = "#6b809e", bg = "NONE", bold = false })
  hl(0, "CursorLineNr",  { fg = "#a1b6d6", bg = "NONE", bold = true })
  hl(0, "Folded",        { fg = "#8094b4", bg = "NONE", bold = false })
  hl(0, "FoldColumn",    { fg = "#8094b4", bg = "NONE" })
  -- Barbar tabline
  hl(0, "BufferCurrent",       { bg = "NONE", fg = "#eef1f8" })
  hl(0, "BufferCurrentMod",    { bg = "NONE", fg = "#e5c07b", italic = true })
  hl(0, "BufferCurrentSign",   { bg = "NONE", fg = "#61afef" })
  hl(0, "BufferCurrentIcon",   { bg = "NONE", fg = "#61afef" })
  hl(0, "BufferInactive",      { bg = "NONE", fg = "#6b809e" })
  hl(0, "BufferInactiveMod",   { bg = "NONE", fg = "#e5c07b", italic = true })
  hl(0, "BufferInactiveSign",  { bg = "NONE", fg = "#8094b4" })
  hl(0, "BufferInactiveIcon",  { bg = "NONE", fg = "#6b809e" })
  hl(0, "BufferVisible",       { bg = "NONE", fg = "#a1b6d6" })
  hl(0, "BufferTabpageFill",   { bg = "NONE", fg = "#a1b6d6", bold = true })
  hl(0, "BufferTabpages",      { bg = "NONE", fg = "#a1b6d6", bold = true })
  hl(0, "BufferTabpage",       { bg = "NONE", fg = "#FFD700", bold = true })
  -- Remove LSP/diagnostic underlines
  hl(0, "DiagnosticUnderlineError",     { underline = false, undercurl = false })
  hl(0, "DiagnosticUnderlineWarn",      { underline = false, undercurl = false })
  hl(0, "DiagnosticUnderlineInfo",      { underline = false, undercurl = false })
  hl(0, "DiagnosticUnderlineHint",      { underline = false, undercurl = false })
  hl(0, "LspDiagnosticsUnderlineError", { underline = false, undercurl = false })
  hl(0, "LspDiagnosticsUnderlineWarn",  { underline = false, undercurl = false })
  hl(0, "LspDiagnosticsUnderlineInfo",  { underline = false, undercurl = false })
  hl(0, "LspDiagnosticsUnderlineHint",  { underline = false, undercurl = false })
  -- Remove ~ at end of buffer
  vim.opt.fillchars:append({ eob = " " })

  -- Barbar: no round separators, no buffer numbers
  vim.g.barbar_auto_setup = false
  require'barbar'.setup {
    icons = {
      separator = { left = '', right = '' },
      separator_at_end = true,
      buffer_index = false,
    }
  }
end

return M