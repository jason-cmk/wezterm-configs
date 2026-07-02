local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 15

-- Advertise WezTerm's real capabilities (synchronized updates etc.) instead of
-- the conservative xterm-256color default. Requires the wezterm terminfo,
-- installed at ~/.terminfo (tic -x wezterm.terminfo). Notably lets tmux enable
-- flicker-free synchronized redraws.
config.term = 'wezterm'

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.color_scheme = 'Catppuccin Mocha'

config.initial_cols = 140
config.initial_rows = 35

config.window_background_opacity = 0.93

local act = wezterm.action
config.keys = {
    -- paste from the clipboard
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}

config.warn_about_missing_glyphs = false

config.window_close_confirmation = 'NeverPrompt'

return config
