local on_attach = function(_, bufnr)
end

-- disable semanticTokens
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.workspace.didChangeWatchedFiles.relativePatternSupport = true
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

vim.lsp.config('*', {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
});

vim.lsp.enable('lua_ls')
vim.lsp.enable('nixd')
vim.lsp.enable('vue_ls')
vim.lsp.enable('vtsls')
-- vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
