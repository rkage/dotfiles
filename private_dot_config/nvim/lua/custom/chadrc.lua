local M = {}

M.ui = {
  theme = "nord",
  hl_override = {
    Normal = { bg = "NONE" },
    NvimTreeNormal = { bg = "#1e222a" },
    NvimTreeNormalNC = { bg = "#1e222a" },
    NvimTreeWinSeparator = {
      fg = "#1e222a",
      bg = "NONE",
    },
    Comment = { italic = true },
    IndentBlanklineChar = { fg = "#252931" },
    IndentBlanklineContextStart = {
      bg = "#252931"
    }
  }
}

M.plugins = require "custom.plugins"

return M
