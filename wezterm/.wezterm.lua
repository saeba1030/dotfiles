-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font_size = 14
config.window_background_opacity = 0.95
config.initial_cols = 130
config.initial_rows = 30

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
	  key = 'q',
	  mods = 'LEADER',
	  action = wezterm.action.PaneSelect,
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 's',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 's', mods = 'CTRL' },
  },
}

-- and finally, return the configuration to wezterm
return config
