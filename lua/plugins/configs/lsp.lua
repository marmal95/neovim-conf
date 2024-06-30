local M = {}

M.servers = {
  clangd = {},
  rust_analyzer = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }
}

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

  for name, opts in pairs(M.servers) do
    opts.on_attach = M.on_attach
    opts.capabilities = M.capabilities
    require("lspconfig")[name].setup(opts)
  end
end

return M
