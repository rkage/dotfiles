local wezterm = require("wezterm")

local config = {}

config.front_end = "WebGpu"
config.initial_rows = 50
config.initial_cols = 238

config.font = wezterm.font("MonoLisa")
config.font_size = 12
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"

config.color_scheme = "Nord (base16)"
config.colors = {
  background = "#191c1f",
}

return config
