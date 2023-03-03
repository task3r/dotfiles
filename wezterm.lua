local wezterm = require('wezterm')
local act = wezterm.action

return {
    --
    -- looks
    --
    enable_tab_bar = false,
    font = wezterm.font('JetBrainsMono Nerd Font Mono'),
    font_size = 16.0,
    colors = {
        background = '#282727',
        foreground = '#ebdab1',
        cursor_bg = '#ebdab1',
        cursor_fg = '#282727',
        cursor_border = '#3c3735',
        selection_fg = '#ebdab1',
        selection_bg = '#665b53',
        ansi = {
            '#282727', -- black, color 0
            '#cb231d', -- red, color 1
            '#98961a', -- green, color 2
            '#d69821',
            '#458487',
            '#b06185',
            '#689c69',
            '#a89883',
        },
        brights = {
            '#928273', -- black, color 0
            '#fa4834', -- red, color 1
            '#b8ba26', -- green, color 2
            '#f9bc2f',
            '#83a497',
            '#d2859a',
            '#8ebf7b',
            '#ebdab1',
        },
    },
    --
    -- behaviour
    --
    keys = {
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = act.SendKey {
                key = 'b',
                mods = 'ALT',
            },
        },
        {
            key = 'RightArrow',
            mods = 'OPT',
            action = act.SendKey { key = 'f', mods = 'ALT' },
        },
        {
            key = 'LeftArrow',
            mods = 'CMD',
            action = act.SendKey { key = 'Home' },
        },
        {
            key = 'RightArrow',
            mods = 'CMD',
            action = act.SendKey { key = 'End' },
        },
        {
            key = 'Backspace',
            mods = 'CMD',
            action = act.SendKey { key = 'w', mods = 'ALT' },
        },
        {
            key = 'Backspace',
            mods = 'CMD|SHIFT',
            action = act.SendKey { key = 'k', mods = 'CTRL' },
        },
    },
    hyperlink_rules = {
        -- Linkify things that look like URLs and the host has a TLD name.
        {
            regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
            format = '$0',
        },

        -- linkify email addresses
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = 'mailto:$0',
        },

        -- file:// URI
        {
            regex = [[\bfile://\S*\b]],
            format = '$0',
        },

        -- Linkify things that look like URLs with numeric addresses as hosts.
        -- E.g. http://127.0.0.1:8000 for a local development server,
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = '$0',
        },
    }
}
