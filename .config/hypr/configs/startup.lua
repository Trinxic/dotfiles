--        __           __
--   ___ / /____ _____/ /___ _____
--  (_-</ __/ _ `/ __/ __/ // / _ \
-- /___/\__/\_,_/_/  \__/\_,_/ .__/
--                          /_/
-- https://wiki.hyprland.org/Configuring/Keywords/#executing

local vars = require("vars")

-- Wallpaper | https://github.com/LGFae/swww | help: https://www.youtube.com/watch?v=gjrVunNPj5c
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpanel")
	hl.exec_cmd("awww init")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("$HOME/.config/swww/random.sh") -- USE LUA FUNCTION INSTEAD
	hl.exec_cmd(vars.menu)
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
	-- hl.exec_cmd("waybar")
	-- hl.exec_cmd("hypridle")
	-- hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
