return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      row = 0.35,
      col = 0.50,
      border = "rounded",
      preview = {
        border = "border",
        wrap = "nowrap",
        hidden = "nohidden",
        vertical = "down:45%",
        horizontal = "right:60%",
        layout = "flex",
        flip_columns = 120,
      },
    },
    fzf_opts = {
      ["--layout"] = "reverse-list",
    },
    files = {
      prompt = "Files❯ ",
      cwd_prompt = false,
    },
    grep = {
      prompt = "Rg❯ ",
    },
  },
}
