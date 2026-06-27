---@module 'hl'

local mainMod = "SUPER"

-- =========================
-- CONFIG
-- =========================
hl.config({
    monitors = {
        {
            output = "DP-1",
            mode = "1600x900@60",
            position = "0x0",
            scale = 1,
            transform = 3
        },
        {
            output = "DP-2",
            mode = "1920x1080@60",
            position = "900x0",
            scale = 1
        }
    },

    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        ["col.active_border"] = "rgba(00000000)",
        ["col.inactive_border"] = "rgba(00000000)"
    },

    decoration = {
        rounding = 0,
        blur = { enabled = false },
        shadow = { enabled = false }
    },

    animations = {
        enabled = true
    }
})

-- =========================
-- ANIMATIONS
-- =========================
hl.curve("instant_snap", {
    type = "bezier",
    points = { {0.1, 1.0}, {0.1, 1.0} }
})

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "instant_snap", style = "popin 95%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "instant_snap", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "instant_snap" })
hl.animation({ leaf = "layers", enabled = true, speed = 1, bezier = "instant_snap", style = "fade" })

-- =========================
-- BASIC APPS
-- =========================
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("firefox"))

hl.bind("SUPER + B", hl.dsp.exec_cmd("pkill waybar || waybar"))

hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

-- =========================
-- 🔥 WORKSPACE SWITCHING (FIXED - WORKING)
-- =========================
local function ws(i)
    return hl.dsp.focus({ workspace = i })
end

hl.bind("SUPER + 1", ws(1))
hl.bind("SUPER + 2", ws(2))
hl.bind("SUPER + 3", ws(3))
hl.bind("SUPER + 4", ws(4))
hl.bind("SUPER + 5", ws(5))
hl.bind("SUPER + 6", ws(6))
hl.bind("SUPER + 7", ws(7))
hl.bind("SUPER + 8", ws(8))
hl.bind("SUPER + 9", ws(9))
hl.bind("SUPER + 0", ws(10))

-- =========================
-- MOVE WINDOWS
-- =========================
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- =========================
-- FOCUS MOVEMENT
-- =========================
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- =========================
-- MEDIA
-- =========================
hl.bind(mainMod .. " + MINUS", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind(mainMod .. " + EQUAL", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + BACKSLASH", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.exec_cmd("playerctl next"))

-- =========================
-- SCREENSHOT
-- =========================
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd("/home/n/.local/bin/screenshot.fish"))
