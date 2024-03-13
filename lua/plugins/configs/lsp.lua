local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.on_attach = function(_, bufnr)
  require('core.utils').load_mappings('lspconfig', { buffer = bufnr })
end

function M:configure()
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

require("lspconfig").tsserver.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
}

-- require("lspconfig").clangd.setup {
--   on_attach = M.on_attach,
--   capabilities = M.capabilities,
-- }

return M
