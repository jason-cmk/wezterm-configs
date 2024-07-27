local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.default_domain = 'WSL:Arch'

config.font = wezterm.font('CaskaydiaMono Nerd Font Mono')
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.95

local act = wezterm.action
config.keys = {
    -- paste from the clipboard
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

    -- paste from the primary selection
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

return config
