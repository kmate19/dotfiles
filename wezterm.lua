local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") ~= nil then
	config.default_domain = "WSL:Arch"
	config.font_size = 12
end

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.enable_kitty_graphics = true
config.max_fps = 120
config.animation_fps = 120
config.color_scheme = "Gruvbox Dark (Gogh)"
config.audible_bell = "Disabled"

return config
