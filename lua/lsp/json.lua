local M = {}

function M.setup(capabilities)
  vim.lsp.config("jsonls", {
    capabilities = capabilities,
    settings = {
      json = {
        validate = { enable = true },
      },
    },
  })
end

return M
