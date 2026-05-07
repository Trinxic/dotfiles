--    __            __   _         __
--   / /_____ __ __/ /  (_)__  ___/ /__
--  /  '_/ -_) // / _ \/ / _ \/ _  (_-<
-- /_/\_\\__/\_, /_.__/_/_//_/\_,_/___/
--          /___/
-- https://wiki.hyprland.org/Configuring/Binds/

local vars = require("config/vars")
local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("archlinux-logout"))

-- General
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- close window
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
) -- return to SDDM
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ action = "toggle" }))

-- Waybar
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar")) -- toggle waybar
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill waybar && waybar & disown")) -- restart waybar

-- Screenshot (hyprshot)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -r -z -m region --clipboard-only | satty -f -"))

-- hyprpicker
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))

-- Move window
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move("up"))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move("down"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move("left"))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move("right"))

-- Set Window Split
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("layoutmsg preselect d"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("layoutmsg preselect r"))

-- Resize window  UNSURE IF THESE WILL WORK...
-- hl.bind(mainMod .. "CTRL + left", hl.dsp.window.resize({ x = "-12", y = "0" }))
-- hl.bind(mainMod .. "CTRL + down", hl.dsp.window.resize({ x = "0", y = "12" }))
-- hl.bind(mainMod .. "CTRL + up", hl.dsp.window.resize({ x = "0", y = "-12" }))
-- hl.bind(mainMod .. "CTRL + right", hl.dsp.window.resize({ x = "12", y = "0" }))

-- Move focus with mod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))

-- Scroll through existing workspaces with mod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Wallpaper (awww)
-- hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("$HOME/dotfiles/.config/awww/random.sh")) -- REPLACE WITH LUA FUNCTION
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("$HOME/dotfiles/.config/wofi/wallpaper-switcher.sh")) -- Just use this for now...
hl.bind(mainMod .. " + SHIFT + W", function()
	local dir = os.getenv("HOME") .. "/dotfiles/stownt/photos/wallpapers"

	local fps = 30
	local type = "random"
	local duration = 3
	local params =
		string.format("--transition-fps %d --transition-type %s --transition-duration %d", fps, type, duration)

	local pics = {}
	local handle = io.popen(string.format("ls %q | grep -E '\\.(jpg|jpeg|png|gif)$'", dir))
	if handle then
		for file in handle:lines() do
			table.insert(pics, file)
		end
		handle:close()
	end

	if #pics == 0 then
		return
	end

	math.randomseed(os.time())
	local wallpaper = dir .. "/" .. pics[math.random(#pics)]

	print("[for debugging purposes]: " .. wallpaper)

	hl.dsp.exec_cmd(string.format("awww img %q --outputs=DP-1 %s", wallpaper, params))
	hl.dsp.exec_cmd(string.format("awww img %q --outputs=DP-2 %s", wallpaper, params))
end)
