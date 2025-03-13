local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.default_domain = 'WSL:Arch'

config.font = wezterm.font('CaskaydiaMono Nerd Font')
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.9

config.initial_cols = 140
config.initial_rows = 35

local act = wezterm.action
config.keys = {
    -- paste from the clipboard
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}

config.warn_about_missing_glyphs = false

return config
