-- This is an example Hyprland config file.
-- Syntax is the same as in Hypr, but settings might differ.
--
-- Refer to the wiki for more information.
Theme = "garden"
ThemeDir = "$HOME/.config/hypr/themes/" .. Theme

--Sourcing external config files
require("configs")
require("scripts.lua.monitor-battery-switch")

hl.config({
	general = {
		--cursor_inactive_timeout=1
		layout = "dwindle",
		allow_tearing = true,
	},

	input = {
		repeat_rate = 50,
		repeat_delay = 300,
		numlock_by_default = 1,

		left_handed = 0,
		follow_mouse = 1,
		float_switch_override_focus = 0,

		touchpad = {
			disable_while_typing = 0,
			natural_scroll = 1,
			clickfinger_behavior = 1,
			middle_button_emulation = 1,
			tap_to_click = 1,
			drag_lock = 1,
		},
	},

	dwindle = {
		split_width_multiplier = 1.25,
	},

	master = {
		new_status = "slave",
		new_on_top = 0,
	},

	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.49,
		focus_fit_method = 1,
	},

	cursor = {
		enable_hyprcursor = 1,
		no_warps = 1,
		no_hardware_cursors = 0,
		use_cpu_buffer = 1,
	},

	binds = {
		--workspace_back_and_forth = 1,
		--allow_workspace_cycles = 1,
		pass_mouse_when_bound = 0,
	},

	animations = {
		enabled = 1,
	},

	render = {
		cm_enabled = true,
		direct_scanout = 1,
		cm_auto_hdr = 2,
		new_render_scheduling = true,
		use_fp16 = 1,
	},

	misc = {
		vrr = 1,
		enable_swallow = 1,
		swallow_regex = "^(foot|footclient|kitty|Alacritty)$",
		focus_on_activate = 1,
		animate_manual_resizes = 0,
		animate_mouse_windowdragging = 0,
		initial_workspace_tracking = 1,
	},

	quirks = {
		prefer_hdr = 1,
	},

	ecosystem = {
		enforce_permissions = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	debug = {
		--Toggle for a good time
		manual_crash = 0,
		disable_logs = false,
		--suppress_errors=1,
	},
})

-- Global function so `hyprctl eval` can invoke it
function on_battery_change()
	local battery_state = (get_battery_state and get_battery_state()) or "charging"
	if battery_state == "charging" and battery_state ~= Last_Battery_State then
		-- Apply high-performance settings
		hl.notification.create({ text = "Power: AC Connected", timeout = 2000 })
		set_monitor_battery_rates(battery_state)
		Last_Battery_State = battery_state
	elseif battery_state == "discharging" and battery_state ~= Last_Battery_State then
		-- Apply battery-saving settings
		hl.notification.create({ text = "Power: On Battery", timeout = 2000 })
		set_monitor_battery_rates(battery_state)
		Last_Battery_State = battery_state
	end
end

--plugins
--hl.config({
--	plugin = {
--		borders_plus_plus = {
--			add_borders = 0,
--			--col = {
--			--	border_1 = "rgba(00000000)",
--			--	border_2 = "rgba(2222ffFF)",
--			--},
--		},
--
--		hyprbars = {
--			enabled = false,
--			bar_color = "rgba(00000066)",
--			bar_blur = true,
--			bar_height = 32,
--			bar_text_size = 10,
--			bar_part_of_window = true,
--			bar_precedence_over_border = true,
--			bar_buttons_alignment = "left",
--			bar_button_padding = 8,
--			bar_padding = 12,
--			icon_on_hover = true,
--			on_double_click = "hyprctl dispatch fullscreen 1",
--		},
--	},
--})

--hl.plugin.hyprbars.add_button({
--	bg_color = "rgb(ff4040)",
--	fg_color = "rgb(ffffff)",
--	size = 14,
--	icon = "󰖭",
--	action = "hyprctl dispatch killactive",
--})
--hl.plugin.hyprbars.add_button({
--	bg_color = "rgb(eeee11)",
--	fg_color = "rgb(ffffff)",
--	size = 14,
--	icon = "",
--	action = "hyprctl dispatch fullscreen 1",
--})

hl.device({
	name = "sony-interactive-entertainment-dualsense-wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = "sony-interactive-entertainment-wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = "wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = "dualsense-wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = "razer-razer-deathadder-v2-pro",
	accel_profile = "flat",
})

hl.curve("slow", { type = "bezier", points = { { 0, 0.85 }, { 0.3, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.7, 0.6 }, { 0.1, 1.1 } } })
hl.curve("bounce", { type = "bezier", points = { { 1, 1.6 }, { 0.1, 0.85 } } })
--hl.curve("slingshot", { type = "bezier", points = { { 1, -2 }, { 0.9, 1.25 } } })
--hl.curve("nice", { type = "bezier", points = { { 0, 6.9 }, { 0.5, -4.20 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "bounce", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 20, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "overshot", style = "slide" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "float",
})
hl.gesture({
	fingers = 3,
	direction = "pinch",
	action = "fullscreen",
})
hl.gesture({
	fingers = 3,
	mods = "SUPER",
	direction = "swipe",
	action = "move",
})
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "scroll_move",
})
hl.gesture({
	fingers = 4,
	direction = "pinch",
	action = "cursorZoom",
	zoom_level = 1,
	mode = "live",
})
hl.gesture({
	fingers = 4,
	direction = "down",
	action = "close",
})

--Decoration section in theme file
hl.layer_rule({
	name = "lockscreen-blur",
	match = { namespace = "lockscreen" },
	blur = true,
})

require("themes/" .. Theme .. "/theme")
require("scripts.lua.dunst-pause")
