local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") ~= nil then
	config.default_domain = "WSL:Arch"
	config.win32_system_backdrop = "Acrylic"
	config.font_size = 13
elseif wezterm.target_triple:find("darwin") ~= nil then
	config.macos_window_background_blur = 60
	config.font_size = 17
elseif wezterm.target_triple:find("linux") ~= nil then
	config.font_size = 13
end

config.color_scheme = "rose-pine"
config.font = wezterm.font("Monaspace Neon")
config.window_background_opacity = 0.7
config.audible_bell = "Disabled"

return config
