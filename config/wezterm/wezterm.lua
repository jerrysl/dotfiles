local wezterm = require("wezterm")
local config = {}

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 14

config.color_scheme = "Kanagawa"

-- this didn't fix the ALT key when true or false
-- config.send_composed_key_when_left_alt_is_pressed = false

return config
