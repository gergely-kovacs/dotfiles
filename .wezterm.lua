local wezterm = require 'wezterm'

local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = 'ayu'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
