local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") ~= nil then
	config.default_prog = { "pwsh.exe" }
	config.font_size = 14
	config.window_background_opacity = 0.4
	config.win32_system_backdrop = "Acrylic"
elseif wezterm.target_triple:find("darwin") then
	config.font_size = 16
end

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font = wezterm.font("Iosevka")
config.enable_kitty_graphics = true
config.max_fps = 144
config.animation_fps = 144
config.audible_bell = "Disabled"

return config
