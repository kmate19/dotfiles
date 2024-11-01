local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") ~= nil then
	-- config.default_domain = "WSL:Arch"
	-- config.win32_system_backdrop = "Acrylic"
	config.font_size = 11
elseif wezterm.target_triple:find("darwin") ~= nil then
	config.macos_window_background_blur = 20
	config.font_size = 14
elseif wezterm.target_triple:find("linux") ~= nil then
	config.font_size = 11
end

config.color_scheme = "catppuccin-mocha"
-- config.font = wezterm.font("Inconsolata")
-- config.window_background_opacity = 0.7
config.audible_bell = "Disabled"

return config
