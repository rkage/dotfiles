local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {
    position = {
      x = 130,
      y = 120,
    }
  })
end)

config.front_end = "WebGpu"
config.initial_rows = 46
config.initial_cols = 185

config.font = wezterm.font("MonoLisa")
config.font_size = 12
config.harfbuzz_features = { "zero", "ss06", "ss07", "ss10", "ss11" }
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_padding = {
  left = "2px",
  right = "2px",
  top = "2px",
  bottom = "2px"
}

config.color_scheme = "Nord (base16)"
config.colors = {
  background = "#191c1f",
  tab_bar = {
    active_tab = {
      bg_color = "#191c1f",
      fg_color = "#d8dee9"
    },
    inactive_tab = {
      bg_color = "#1f1f1f",
      fg_color = "#808080"
    },
    inactive_tab_edge = "#1f1f1f"
  }
}

config.window_frame = {
  font = wezterm.font({
    family = "MonoLisa",
    weight = "Light"
  }),
  font_size = 11,
  active_titlebar_bg = "#161616"
}

return config
