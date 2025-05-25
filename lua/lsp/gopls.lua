-- Go language server configuration

local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
  capabilities = require("lsp.cmp").capabilities,
  on_attach = require("lsp.cmp").on_attach,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
}
