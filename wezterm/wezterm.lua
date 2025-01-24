local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Color scheme
config.color_scheme = "OneDark (Gogh)"

config.font_size = 18.0

-- Enable Nerd Fonts v2 glyphs
config.use_cap_height_to_scale_fallback_fonts = true

-- Window configuration
config.window_background_opacity = 0.95
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.native_macos_fullscreen_mode = true

-- Tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 16
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

-- Key bindings
config.keys = {
	-- Split panes
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Navigate panes
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Create and close tabs
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("DefaultDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = false }) },

	-- Toggle between panes
	{ key = "[", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Prev") },
	{ key = "]", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Next") },

	-- Navigate tabs
	{ key = "{", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "}", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(1) },

	-- Toggle full screen
	{ key = "Enter", mods = "CMD", action = wezterm.action.ToggleFullScreen },

	-- Zoom pane to full tab size
	{ key = "Enter", mods = "CMD|SHIFT", action = wezterm.action.TogglePaneZoomState },
}

return config
