local wezterm = require("wezterm")

local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = "ayu"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
