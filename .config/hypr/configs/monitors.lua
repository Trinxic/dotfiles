--                    _ __
--   __ _  ___  ___  (_) /____  _______
--  /  ' \/ _ \/ _ \/ / __/ _ \/ __(_-<
-- /_/_/_/\___/_//_/_/\__/\___/_/ /___/
-- https://wiki.hyprland.org/Configuring/Monitors/

-- Add/Remove the 3rd '-' to toggle code blocks

---[[ main: normal | 2nd: vertical (flipped) & on right
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144",
	position = "0x420", -- 0 to the right (x), 420 pixels down (y)
	scale = "auto",
})
hl.monitor({
	output = "DP-2",
	mode = "1920x1200",
	position = "1920x0",
	scale = "auto",
	transform = 1,
})
--]]

--[[ main: normal | 2nd: vertical (flipped) & on left
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144",
	position = "0x420",
	scale = "auto",
})
hl.monitor({
	output = "DP-2",
	mode = "1920x1200",
	position = "1920x0",
	scale = "auto",
	transform = 1,
})
--]]

--               1200
-- |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
-- |               | y = (1920/2) - (1080/2) = 420
-- |               |/
-- |               |‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
-- |               |                      |
-- |               |                      |
-- | y = 1920/2 -> | <- 1080/2 (relative) |
-- |               |                      |
-- |               |                      |
-- |               |______________________|
-- |               |                      \
-- |               |       1200 + 1920 = 3120
-- |_______________|
