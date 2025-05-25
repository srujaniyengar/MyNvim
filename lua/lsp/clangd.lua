-- C/C++ language server configuration

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  capabilities = require("lsp.cmp").capabilities,
  on_attach = require("lsp.cmp").on_attach,
  cmd = { "clangd", "--background-index" },
}
