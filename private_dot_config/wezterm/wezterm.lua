local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {
    position = { x = 36, y = 120 },
  })
end)

return {
  -- bell
  audible_bell = "Disabled",
  visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    target = "CursorColor",
  },

  -- font
  font = wezterm.font({
    family = "MonoLisa",
    weight = "Light",
    harfbuzz_features = { "zero", "ss02", "ss03", "ss06", "ss07", "ss10", "ss11", "ss13", "ss16" },
  }),
  font_size = 12.0,
  underline_position = "-3px",
  underline_thickness = "150%",

  -- window
  initial_rows = 48,
  initial_cols = 196,
  window_background_opacity = 0.9,
  macos_window_background_blur = 35,
  window_close_confirmation = "NeverPrompt",    window_decorations = "RESIZE",
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = "4px",
    right = "4px",
    top = "4px",
    bottom = "4px",
  },

  -- tab bar
  window_frame = {
    font = wezterm.font({
      family = "MonoLisa",
      weight = "Light",
    }),
    font_size = 11,
    active_titlebar_bg = "#161616",
  },
  hide_tab_bar_if_only_one_tab = true,

  -- colors
  color_scheme = "Nord (base16)",
  colors = {
    background = "#191c1f",
    tab_bar = {
      active_tab = {
        bg_color = "#191c1f",
        fg_color = "#d8dee9",
      },
      inactive_tab = {
        bg_color = "#1f1f1f",
        fg_color = "#808080",
      },
      inactive_tab_edge = "#1f1f1f",
    },
  },

  -- general styling
  default_cursor_style = "BlinkingBlock",
  enable_scroll_bar = false,

  -- general config
  clean_exit_codes = { 130 },
  automatically_reload_config = true,
  front_end = "WebGpu",
  use_resize_increments = true,
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    {
      key = "h",
      mods = "LEADER",
      action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 25 } }),
    },
  },
}
