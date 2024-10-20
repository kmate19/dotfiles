local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "rose-pine"
config.font = wezterm.font("Iosevka")
config.default_domain = "WSL:Arch"
config.window_background_opacity = 0.7
config.win32_system_backdrop = "Acrylic"
config.font_size = 14
config.audible_bell = "Disabled"

return config
