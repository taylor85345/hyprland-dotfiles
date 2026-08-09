-- Monitor Configuration
require("scripts.lua.monitor-battery-switch")

-- Ensure battery monitoring helper functions are loaded
if not get_battery_state then
	pcall(require, "scripts.lua.battery_state")
end

local battery_state = (get_battery_state and get_battery_state()) or "charging"
local edp1_mode = (battery_state == "charging") and "preferred" or "2560x1600@60"
local default_mode = (battery_state == "charging") and "preferred" or "preferred@60"

-- Store configurations in a global table so other scripts can import/reference them
hl.monitor_configs = {
	default = { output = "", mode = default_mode, position = "auto", scale = "auto" },
	ema = { output = "desc:EMA E202HV Q400C0024031", mode = "1600x900", position = "4480x180", scale = 1 },
	vizio = { output = "desc:VIZIO Inc D32h-G9", mode = "1360x768@60", position = "0x0", scale = 1 },
	viewsonic = {
		output = "desc:ViewSonic Corporation VA1655-FHD WMM243781796",
		mode = "preferred",
		position = "-1920x0",
		scale = 1,
	},

	samsung = {
		output = "desc:Samsung Display Corp. ATNA60HU01-0",
		mode = edp1_mode,
		position = "0x0",
		scale = 1.33,
		bitdepth = 10,
		cm = "dcip3",
		--icc = "/home/taylor/.local/share/color/icc/TPLCD_420B_Default.icm",
		supports_wide_color = 1,
		supports_hdr = 1,
		sdr_min_luminance = 0.005,
		sdr_max_luminance = 500,
		min_luminance = 0,
		max_luminance = 1067,
		max_avg_luminance = 496,
		--sdrbrightness=0.4,
		--sdrsaturation=1.2,
	},
	lg = {
		output = "desc:LG Electronics LG ULTRAWIDE 0x0000FE20",
		mode = "preferred",
		position = "1920x0",
		scale = 1,
	},
	sony = {
		output = "desc:Sony SONY TV  *30 0x01010101",
		mode = "3840x2160@120",
		position = "0x-1080",
		scale = 2,
		bitdepth = 10,
		cm = "hdredid",
		sdrbrightness = 1.2,
		sdrsaturation = 0.98,
	},
}

-- Apply all monitor configurations
hl.monitor(hl.monitor_configs.default)
hl.monitor(hl.monitor_configs.ema)
hl.monitor(hl.monitor_configs.vizio)
hl.monitor(hl.monitor_configs.viewsonic)
hl.monitor(hl.monitor_configs.samsung)
hl.monitor(hl.monitor_configs.lg)
hl.monitor(hl.monitor_configs.sony)

-- Automatically configure optimal refresh rates for connected monitors based on battery state
if set_monitor_battery_rates then
	set_monitor_battery_rates(battery_state)
end
