local mainMod = "SUPER"

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
	hl.bind(mainMod .. "+ SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

local directions = {
	h = "left",
	j = "down",
	k = "up",
	l = "right",
	Left = "left",
	Down = "down",
	Up = "up",
	Right = "right",
}

for key, dir in pairs(directions) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }), { release = true })
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }), { release = true })
	hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ monitor = dir }), { release = true })
end

-- Define default application to launch on a given workspace number
local tag_apps = {
	[1] = "kitty --single-instance",
	[2] = "zen-browser",
	[3] = "libreoffice",
	[4] = "dolphin",
	[5] = "vlc",
	[6] = "steam",
	[7] = "krita",
	[8] = "thunderbird",
	[9] = "neovide",
}
function LaunchWSDefault()
	-- Get the active workspace object
	local workspace = hl.get_active_workspace()

	if workspace and workspace.id then
		local app = tag_apps[workspace.id]

		if app then
			-- Use dispatch to execute the command
			hl.dispatch(hl.dsp.exec_cmd(app))
		end
	end
end

hl.bind(mainMod .. " + SHIFT + Return", function()
	LaunchWSDefault()
end)

hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({ x = "0", y = "20", relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({ x = "-20", y = "0", relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = "20", y = "0", relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({ x = "0", y = "-20", relative = true }), { repeating = true })
hl.bind(mainMod .. " + CONTROL + ALT + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + ALT + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CONTROL + ALT + H", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CONTROL + ALT + L", hl.dsp.focus({ workspace = "+1" }))

--Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

--Media Keys
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("kcalc"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("light -A 5"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("light -U 5"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume mute"), { repeating = true, locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.config/dunst/scripts/volume up"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.config/dunst/scripts/volume down"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("~/.config/dunst/scripts/volume micmute"),
	{ repeating = true, locked = true }
)

--Key Binds
hl.bind(
	mainMod .. " + Return",
	hl.dsp.exec_cmd(
		"kitty -c ~/.config/kitty/kitty.conf -c " .. ThemeDir .. "/terminals/kitty_floppy_colors.conf --single-instance"
	)
)
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + Escape", hl.dsp.dpms({ action = "on" }), { locked = true })
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("notify-send 'Config Reloaded'"))
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grimblast --notify copy output"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("grimblast save output - | swappy -f -"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show filebrowser"))
hl.bind(mainMod .. " + ALT + Space ", hl.dsp.group.lock())
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.group.next())
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(
	mainMod .. " + Super_L",
	hl.dsp.exec_cmd("pkill rofi || rofi -no-lazy-grab -show drun -theme " .. ThemeDir .. "/rofi/launcher.rasi"),
	{ release = true }
)

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qs ipc -p " .. ThemeDir .. "/quickshell call bar toggleBar "))
hl.bind(mainMod .. " + ALT + B ", hl.dsp.exec_cmd("rofi-bluetooth"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("ec4Linux change-state"))
hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("rofi -no-lazy-grab -show drun -theme " .. ThemeDir .. "/rofi/launcher.rasi")
)
hl.bind(
	mainMod .. " + SHIFT + D",
	hl.dsp.exec_cmd(
		"GDK_BACKEND=x11 QT_QPA_PLATFORM=xcb SDL_VIDEODRIVER=x11 rofi -drun-show-actions -no-lazy-grab -show drun -theme "
			.. ThemeDir
			.. "/rofi/launcher.rasi"
	)
)
hl.bind(
	mainMod .. " + ALT + D",
	hl.dsp.exec_cmd(
		"prime-run rofi -drun-show-actions -no-lazy-grab -show drun -theme " .. ThemeDir .. "/rofi/launcher.rasi"
	)
)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("~/.local/bin/gpu-switch"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("nerd-dictation end || nerd-dictation begin --simulate-input-tool DOTOOL"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("rofi-rbw --action copy"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + CONTROL + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(
	mainMod .. " + SHIFT + Q",
	hl.dsp.exec_cmd("wlogout -p layer-shell -C ~/.config/hypr/themes/" .. Theme .. "/wlogout/style.css")
)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.local/bin/ffxivrecord.sh wl"))
hl.bind(mainMod .. " + ALT + R ", hl.dsp.exec_cmd("~/.local/bin/ffxivrecord.sh wlsw"))
hl.bind(mainMod .. " + ALT + CONTROL + R", hl.dsp.exec_cmd("~/.local/bin/ffxivrecord.sh -g wlsw"))
hl.bind(mainMod .. " + CONTROL + R", hl.dsp.exec_cmd("~/.local/bin/ffxivrecord.sh -g wl"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.local/bin/ffxivrecord.sh kill"))
hl.bind(mainMod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast --notify copy area"))
hl.bind(mainMod .. " + ALT + T ", hl.dsp.exec_cmd("pkill trayer"))
hl.bind(mainMod .. " + V", hl.dsp.workspace.toggle_special("volume"))
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.exec_cmd("hyprpwcenter"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/workspace"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("yt-x -s rofi"))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd("yt-x -s rofi -S"))

hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("footclient -e ncmpcpp"))
hl.bind(mainMod .. " + ALT + F2 ", hl.dsp.exec_cmd("dm-radio"))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.exec_cmd("footclient -e spt"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("gamescope -H 1080 --adaptive-sync -e -- steam-runtime -gamepadui"))
hl.bind(mainMod .. " + SHIFT + F6", hl.dsp.exec_cmd("pkill steam"))
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd("pkill noafk || (noafk & notify-send 'Preventing AFK')"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprctl keyword misc:no_vfr 0"))
hl.bind(mainMod .. " + ALT + F12 ", hl.dsp.exec_cmd("hyprctl keyword misc:no_vfr 1"))
hl.bind(mainMod .. " + SHIFT + F23", hl.dsp.exec_cmd("mpv '/home/taylor/.config/hypr/Sloppy.mp3'"))

hl.bind(
	"Print",
	hl.dsp.exec_cmd("grimblast --notify save output $(xdg-user-dir PICTURES)/Screenshots/$(date +'%Y%m%d%H%M%S.jpg')")
)
hl.bind(
	mainMod .. " + A",
	hl.dsp.exec_cmd(
		[[bash -c "if hyprctl activewindow | grep 'floating: 0'; then hyprctl dispatch togglefloating active; fi; hyprctl dispatch pin active"]]
	)
)
hl.bind(
	mainMod .. " + KP_Subtract",
	hl.dsp.exec_cmd("pkill ydotoold || (ydotoold & while pgrep ydotoold; do ydotool click 0xC0 ; done)")
)
hl.bind(
	mainMod .. " + O",
	hl.dsp.exec_cmd(
		[[grim -g "$(slurp)"" -t ppm - | tesseract -l eng+pol+jpn stdin stdout | wl-copy; notify-send 'Tesseract OCR' "Copied \"$(wl-paste)\""]]
	)
)
hl.bind(
	mainMod .. " + X",
	hl.dsp.exec_cmd(
		"color=$(hyprpicker) && wl-copy $color && convert -size 100x100 xc:$color /tmp/mycol.png && notify-send --expire-time=100000 -i /tmp/mycol.png 'Hyprpicker' $color"
	)
)
hl.bind(
	mainMod .. " + ALT + X ",
	hl.dsp.exec_cmd(
		"color=$(hyprpicker | tr '[:upper:]' '[:lower:]') && wl-copy $color && convert -size 100x100 xc:$color /tmp/mycol.png && notify-send --expire-time=100000 -i /tmp/mycol.png 'Hyprpicker' $color"
	)
)
hl.bind(
	mainMod .. " + CONTROL + S",
	hl.dsp.exec_cmd("grimblast --notify save area $(xdg-user-dir PICTURES)/Screenshots/$(date +'%Y%m%d%H%M%S.png')")
)
hl.bind(
	mainMod .. " + SHIFT + O",
	hl.dsp.exec_cmd(
		[[grim -g "$(slurp)" -t ppm - | tesseract -l eng+pol+jpn stdin stdout | trans -b | wl-copy; notify-send 'Translation' "\"$(wl-paste)\""]]
	)
)
hl.bind(
	mainMod .. " + SHIFT + V",
	hl.dsp.exec_cmd(
		[[wl-clipboard-history -p "$(wl-clipboard-history -l 20 | tr -d '\200-\377' | sed 's/\(.\{30\}\).*/\1.../' | rofi -dmenu | cut -d ',' -f1)" | wl-copy]]
	)
)
hl.bind(
	mainMod .. " + SHIFT + C",
	hl.dsp.exec_cmd(
		[[bash -c 'if hyprctl getoption render:cm_enabled | grep -q "bool: true"; then hyprctl eval "hl.config({ render = { cm_enabled = false }})"; notify-send -u low "Color Management" "OFF"; else hyprctl eval "hl.config({ render = { cm_enabled = true }})"; notify-send -u low "Color Management" "ON"; fi']]
	)
)
--bind=mainModSHIFT,B,hl.dsp.exec_cmd("brave --enable-features=UseOzonePlatform --ozone-platform=wayland
--bind=mainModSHIFT,Y,hl.dsp.exec_cmd("~/.local/bin/rofi_mpvtube
--bind=mainModSHIFT,F23,hl.dsp.exec_cmd("sleep 1 && imv -f "/home/taylor/Pictures/IMG_2166_edited.jpg"
--bindr=mainModALT,h,splitratio,-0.1
--bindr=mainModALT,l,splitratio,+0.1
