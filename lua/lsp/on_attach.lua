local M = {}

function M.on_attach(event)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
  end

  map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  map("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
  map("K", vim.lsp.buf.hover, "Hover Documentation")
  map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  map("<leader>cl", vim.lsp.codelens.run, "Run Codelens")

  -- JS/TS specific
  map("<leader>co", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })
  end, "[O]rganize Imports")

  map("<leader>cu", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnusedImports" },
        diagnostics = {},
      },
    })
  end, "Remove [U]nused Imports")

  map("<leader>ci", function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.addMissingImports" },
        diagnostics = {},
      },
    })
  end, "Add Missing [I]mports")

  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
  end
  if client and client.server_capabilities.codeLensProvider then
    vim.lsp.codelens.refresh()
  end
end

return M
