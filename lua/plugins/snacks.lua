return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    { "<leader>.", function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>n", function() require("snacks").notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() require("snacks").notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>bd", function() require("snacks").bufdelete() end, desc = "Delete Buffer" },
    { "<leader>ba", function() require("snacks").bufdelete.all() end, desc = "Delete All Buffers" },
    { "<leader>bo", function() require("snacks").bufdelete.other() end, desc = "Delete Other Buffers" },
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    { "<leader>tt", function() require("snacks").terminal() end, desc = "Terminal" },
    { "<leader>s", function() require("snacks").picker.smart() end, desc = "Smart Find Files" },
    { "<leader>:", function() require("snacks").picker.command_history() end, desc = "Command History" },
  },
}
