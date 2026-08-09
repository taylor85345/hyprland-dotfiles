require("scripts.lua.battery_state")

-- Helper function to switch refresh rates portably for all connected monitors
function set_monitor_battery_rates(bat_state)
	if not bat_state or bat_state == "" then
		bat_state = get_battery_state()
	end

	local mons = (hl.get_monitors and hl.get_monitors()) or {}

	for _, m in ipairs(mons) do
		local name = m.name
		local width = m.width
		local height = m.height

		local target_mode
		if bat_state == "charging" then
			target_mode = "preferred"
		else
			if width and height and width > 0 and height > 0 then
				target_mode = string.format("%dx%d@60", width, height)
			else
				target_mode = "preferred"
			end
		end

		-- Check if monitor has custom entry in hl.monitor_configs
		local base_config = nil
		if hl.monitor_configs then
			for k, cfg in pairs(hl.monitor_configs) do
				if cfg.output == name or (cfg.output and m.description and cfg.output:find(m.description, 1, true)) then
					base_config = cfg
					break
				end
			end
		end

		if base_config then
			base_config.mode = target_mode
			local config = {}
			for k, v in pairs(base_config) do
				config[k] = v
			end
			hl.monitor(config)
		else
			hl.monitor({
				output = name,
				mode = target_mode,
				position = "auto",
				scale = "auto",
			})
		end
	end
end

-- Backward-compatibility wrapper for udev script / set_eDP1_hz
function set_eDP1_hz(bat_state)
	set_monitor_battery_rates(bat_state)
end
