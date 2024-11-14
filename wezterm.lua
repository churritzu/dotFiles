local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12

config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Dracula (Official)"

return config
