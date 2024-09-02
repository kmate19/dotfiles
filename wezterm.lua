local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Iosevka Term")
config.font_size = 19
config.color_scheme = "Gruvbox dark, pale (base16)"
config.audible_bell = "Disabled"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
