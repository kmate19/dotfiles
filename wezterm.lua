local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") ~= nil then
	-- config.win32_system_backdrop = "Acrylic"
	config.default_domain = "WSL:Arch"j
	config.font_size = 14
elseif wezterm.target_triple:find("darwin") ~= nil then
	config.font_size = 16
elseif wezterm.target_triple:find("linux") ~= nil then
	config.font_size = 14
end

config.enable_kitty_graphics = true
config.max_fps = 120
config.animation_fps = 120
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("Iosevka Term")
-- config.window_background_opacity = 0.7
config.audible_bell = "Disabled"

return config
