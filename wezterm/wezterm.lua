local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
local resurrect = wezterm.plugin.require 'https://github.com/MLFlexer/resurrect.wezterm'

local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = 'ayu'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 11
config.font = wezterm.font 'FiraMono Nerd Font'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '=',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'm',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action_callback(function(win, pane)
      resurrect.save_state(resurrect.workspace_state.get_workspace_state())
      resurrect.window_state.save_window_action()
    end),
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, '^([^/]+)') -- match before '/'
        id = string.match(id, '([^/]+)$') -- match after '/'
        id = string.match(id, '(.+)%..+$') -- remove file extension
        local state
        if type == 'workspace' then
          state = resurrect.load_state(id, 'workspace')
          resurrect.workspace_state.restore_workspace(state, {
            relative = true,
            restore_text = true,
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
          })
        elseif type == 'window' then
          state = resurrect.load_state(id, 'window')
          resurrect.window_state.restore_window(pane:window(), state, {
            relative = true,
            restore_text = true,
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
            -- uncomment this line to use active tab when restoring
            -- tab = win:active_tab(),
          })
        end
      end)
    end),
  },
  {
    key = 's',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 's', mods = 'CTRL' },
  },
}

smart_splits.apply_to_config(config)

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
