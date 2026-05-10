hl.monitor({
    output = "DP-1",
    mode = "1920x1080@165.00",
    position = "0x0",
    scale = "1",
})
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@74.97",
    position = "-1920x0",
    scale = "1",
})
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.env("SHELL", "fish")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("steam -silent %U")
    hl.exec_cmd("discord --start-minimized")
    hl.exec_cmd("polychromatic-tray-applet")
end)

hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 0,
        layout      = "dwindle",
    },
    decoration = {
        rounding = 4,
        rounding_power = 2,
        blur = {
            enabled = false,
        },
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        kb_layout    = "us",
        kb_options   = "caps:escape",
        repeat_delay = 140,
        repeat_rate  = 70,
    },
    animations = {
        enabled = true,
    },
})
hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "default" })

-- Actions
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("wofi"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + P", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + C", hl.dsp.window.close())

-- Intra-workspace navigation
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Plugin-less split-monitor-workspaces type behavior.
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-1"
    })
    hl.workspace_rule({
        workspace = tostring(i + 10),
        monitor = "DP-2"
    })

    local function split_aware_focus()
        if hl.get_active_monitor().name == "DP-2" then
            hl.dispatch(hl.dsp.focus({ workspace = tostring(i + 10) }))
        else
            hl.dispatch(hl.dsp.focus({ workspace = tostring(i) }))
        end
    end
    local function split_aware_move()
        if hl.get_active_monitor().name == "DP-2" then
            hl.dispatch(hl.dsp.window.move({ workspace = tostring(i + 10) }))
        else
            hl.dispatch(hl.dsp.window.move({ workspace = tostring(i) }))
        end
    end

    local key = i % 10
    hl.bind("SUPER + " .. key, split_aware_focus)
    hl.bind("SUPER + SHIFT + " .. key, split_aware_move)
end

-- Move/resize windows with "SUPER" + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
