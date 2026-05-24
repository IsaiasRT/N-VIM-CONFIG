local M = {}

function M.setup(capabilities)
  vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html", "htmldjango" },
  })
end

return M
