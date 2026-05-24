vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<CR>", { desc = "Write All" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

vim.keymap.set("x", "<leader>p", [['_dP]], { desc = "Paste without replacing register" })

vim.keymap.set({ "n", "v" }, "<leader>d", [['_d]], { desc = "Delete without replacing register" })
vim.keymap.set({ "n", "v" }, "<leader>c", [['_c]], { desc = "Change without replacing register" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Open the current HTML file in the default browser.
-- If a same-name .js file exists (e.g. index.html -> index.js), it is
-- mentioned in the notification. The browser automatically loads any JS
-- referenced via <script> tags in the HTML.
vim.keymap.set("n", "<leader>ht", function()
  local file = vim.fn.expand("%:p")
  if not file:match("%.html$") then
    vim.notify("Current file is not an HTML file!", vim.log.levels.WARN)
    return
  end

  local js_file = file:gsub("%.html$", ".js")
  local js_exists = vim.fn.filereadable(js_file) == 1

  local ok, err = pcall(vim.ui.open, file)
  if not ok then
    vim.notify("Failed to open browser: " .. tostring(err), vim.log.levels.ERROR)
    return
  end

  local msg = "Opened " .. vim.fn.fnamemodify(file, ":t") .. " in browser"
  if js_exists then
    msg = msg .. " (with " .. vim.fn.fnamemodify(js_file, ":t") .. ")"
  end
  vim.notify(msg, vim.log.levels.INFO)
end, { desc = "Open HTML + JS in browser" })
