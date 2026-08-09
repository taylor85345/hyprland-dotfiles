-- ~/.config/hypr/hyprland.lua

print("[Dunst-Scanout] Initializing async Direct Scanout watcher...")

local dunst_is_paused = false
local temp_file = "/tmp/hypr_scanout_state.txt"

local scanout_timer = hl.timer(function()
	-- 1. Read the state dumped by the PREVIOUS timer tick
	local file = io.open(temp_file, "r")
	if file then
		local monitors_output = file:read("*a")
		file:close()

		local is_direct_scanout_active = false
		local current_scanout_id = "0"

		-- Parse the file text
		for line in string.gmatch(monitors_output, "[^\r\n]+") do
			local ds_val = string.match(line, "directScanoutTo:%s*(%S+)")
			if ds_val and ds_val ~= "0" and ds_val ~= '""' then
				is_direct_scanout_active = true
				current_scanout_id = ds_val
				break
			end
		end

		-- Toggle dunst notifications
		if is_direct_scanout_active and not dunst_is_paused then
			print("[Dunst-Scanout] ACTIVE (ID: " .. current_scanout_id .. ") - Pausing")
			-- Use & to run dunstctl in the background to prevent any micro-stutters
			os.execute("dunstctl set-paused true &")
			dunst_is_paused = true
		elseif not is_direct_scanout_active and dunst_is_paused then
			print("[Dunst-Scanout] INACTIVE (ID: 0) - Resuming")
			os.execute("dunstctl set-paused false &")
			dunst_is_paused = false
		end
	end

	-- 2. Dispatch the NEXT check in the background
	-- The '&' is critical: it tells the shell to run this without making Lua wait
	os.execute("hyprctl monitors > " .. temp_file .. " 2>/dev/null &")
end, { timeout = 5000, type = "repeat" })
