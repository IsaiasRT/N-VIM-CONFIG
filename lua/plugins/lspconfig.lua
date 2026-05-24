return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Load language-specific LSP configs
      require("lsp.vtsls").setup(capabilities)
      require("lsp.html").setup(capabilities)
      require("lsp.css").setup(capabilities)
      require("lsp.json").setup(capabilities)

      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls", "html", "cssls", "jsonls", "lua_ls" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          require("lsp.on_attach").on_attach(event)
        end,
      })
    end,
  },
}
