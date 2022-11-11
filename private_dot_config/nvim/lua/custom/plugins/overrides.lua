local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "css",
    "html",
    "hcl",
    "dockerfile",
    "fish",
    "gitattributes",
    "gitignore",
    "toml",
    "json",
    "json5",
    "jsonc",
    "yaml",
  },
}

M.blankline = {
  use_treesitter = true,
  -- char_list = {"", "┊", "┆", "¦", "|", "¦", "┆", "┊", ""},
  -- char = "▏",
  char = "¦",
  context_char = "¦",
  show_current_context = true,
  show_current_context_start = true,
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
  }
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "ansible-language-server",
    "yaml-language-server",
  }
}

M.gitsigns = {
  signs = {
    add = { hl = "DiffAdd", text = "▎", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "▎", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
}

return M
