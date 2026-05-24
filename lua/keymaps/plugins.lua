local M = {}

function M.setup()
  vim.keymap.set("n", "<leader>e", function() require("oil").open() end, { desc = "Open Oil (file dir)" })
  vim.keymap.set("n", "<leader>E", function() require("oil").open(vim.fn.getcwd()) end, { desc = "Open Oil (cwd)" })
  vim.keymap.set("n", "-", function() require("oil").open() end, { desc = "Open parent directory" })

  vim.keymap.set("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find files" })
  vim.keymap.set("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
  vim.keymap.set("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "Find buffers" })
  vim.keymap.set("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "Find help" })
  vim.keymap.set("n", "<leader>fr", function() require("fzf-lua").oldfiles() end, { desc = "Recent files" })
  vim.keymap.set("n", "<leader>fc", function() require("fzf-lua").grep_cword() end, { desc = "Find word under cursor" })

  vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree" })

  vim.keymap.set("n", "<leader>th", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
  end, { desc = "Toggle inlay hints" })

  vim.keymap.set("n", "<leader>td", function()
    local enabled = vim.diagnostic.is_enabled()
    vim.diagnostic.enable(not enabled)
  end, { desc = "Toggle diagnostics" })

  vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line() end, { desc = "Git blame line" })
end

return M
