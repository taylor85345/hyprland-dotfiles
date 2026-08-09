-- Helper function to poll current battery/charging status
Last_Battery_State = (get_battery_state and get_battery_state()) or "charging"
function get_battery_state()
	-- 1. Check AC/ADP adapter online status
	local ac_paths = {
		"/sys/class/power_supply/ADP0/online",
		"/sys/class/power_supply/AC/online",
		"/sys/class/power_supply/ACAD/online",
	}

	for _, path in ipairs(ac_paths) do
		local f = io.open(path, "r")
		if f then
			local val = f:read("*all")
			f:close()
			if val then
				if val:match("1") then
					return "charging"
				elseif val:match("0") then
					return "discharging"
				end
			end
		end
	end

	-- 2. Fallback: check Battery status
	local bat_paths = {
		"/sys/class/power_supply/BAT0/status",
		"/sys/class/power_supply/BAT1/status",
	}

	for _, path in ipairs(bat_paths) do
		local f = io.open(path, "r")
		if f then
			local status = f:read("*all")
			f:close()
			if status then
				status = status:gsub("%s+", "")
				if status == "Discharging" then
					return "discharging"
				elseif status == "Charging" or status == "Full" or status == "Notcharging" then
					return "charging"
				end
			end
		end
	end

	-- Default fallback if unknown
	return "charging"
end
