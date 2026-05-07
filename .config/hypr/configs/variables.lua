--                 _      __   __
--  _  _____ _____(_)__ _/ /  / /__ ___
-- | |/ / _ `/ __/ / _ `/ _ \/ / -_|_-<
-- |___/\_,_/_/ /_/\_,_/_.__/_/\__/___/
-- https://wiki.hypr.land/Configuring/Basics/Variables/

-- NOTE: Some defaults are commented out. Some may no longer exist. Not all options are present in this file

hl.config({
	general = {
		border_size = 3,
		gaps_in = 4,
		gaps_out = 8,
		col = {
			active_border = {
				colors = {
					"rgba(ff0000ff) rgba(ffbf00ff) rgba(bfff00ff) rgba(00ff00ff) rgba(00ffbfff) rgba(00bfffff) rgba(0000ffff) rgba(bf00ffff) rgba(ff00bfff)",
				},
			},
			inactive_border = { colors = { "rgba(595959aa)" } },
			-- nogroup_border = 0xff444444,  -- not sure which type these values are..
			-- nogroup_border_active = 0xffff00ff,  -- not that it matters because the are default
		},
		layout = "dwindle",

		-- cursor_inactive_timeout = 0,
		-- no_border_on_floating = false,
		-- gaps_workspaces = 0,
		-- no_cursor_warps = false,
		-- no_focus_fallback = false,
		-- apply_sens_to_raw = false,
		-- resize_on_border = false,
		-- extend_border_grab_area = 15,
		-- hover_icon_on_border = true,
		-- allow_tearing = false,  -- https://wiki.hypr.land/Configuring/Tearing/
		-- resize_corner = 0,
	},
	decoration = {
		rounding = 10,
		rounding_power = 2, -- not sure what this is
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = { --https://wiki.hypr.land/Configuring/Variables/#blur
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = { -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
		enabled = true,
	},
	dwindle = { -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout
		pseudotile = true,
		preserve_split = true, -- "You probably want this"
	},
	master = {
		new_status = "slave",
	},
	scrolling = { --  https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout
		fullscreen_on_one_column = true,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
	input = { -- https://wiki.hypr.land/Configuring/Animations/  [may still exist..?]
		kb_layout = "us",
		kb_variant = "", -- could add "dvp" (dvorak-programmer)
		kb_model = "",
		-- kb_options = "grp:ralt_rshift_toggle",  -- right(alt+shift) toggle kb_variant
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0, -- TODO: Change later to be more in-line with Windows sensitivity

		-- touchpad = {  -- https://wiki.hypr.land/Configuring/Variables/#touchpad
		--     natural_scroll = false,
		-- },
	},
})
