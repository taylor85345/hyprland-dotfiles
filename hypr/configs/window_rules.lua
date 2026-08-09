hl.workspace_rule({ workspace = "1", monitor = "desc:Samsung Display Corp. ATNA60HU01-0", default = true })
hl.workspace_rule({ workspace = "2", monitor = "desc:LG Electronics LG ULTRAWIDE 0x0000FE20", default = true })
hl.workspace_rule({ workspace = "7", monitor = "desc:EMA E202HV Q400C0024031", default = true })
hl.workspace_rule({
	workspace = "6",
	monitor = "desc:Sony SONY TV  *30 0x00000101",
	default = true,
	layout = "scrolling",
})

-- example window rules
-- for windows named/classed as abc and xyz
hl.window_rule({ match = { class = "^(DOOM*)" }, size = { 1920, 1080 } })
hl.window_rule({ match = { class = "^(Minecraft*)" }, size = { 1920, 1080 } })
hl.window_rule({ match = { class = "^(bambam)" }, fullscreen = true })
hl.window_rule({ match = { class = "^(bethesda.net_launcher.exe)$" }, move = { 320, 140 } })
hl.window_rule({ match = { class = "^(com.saivert.pwvucontrol)" }, float = true })
hl.window_rule({ match = { class = "^(cool-retro-term)$", title = "^(cool-retro-term)$" }, fullscreen = true })
hl.window_rule({ match = { class = "^(explorer.exe)" }, fullscreen = true })
hl.window_rule({ match = { class = "^(imv)" }, float = true })
hl.window_rule({ match = { class = "^(inkstitch)" }, float = true })
hl.window_rule({ match = { class = "^(pavucontrol-qt)" }, float = true })
hl.window_rule({ match = { class = "^(zoom)" }, float = true })
hl.window_rule({ match = { title = [[ ^("Break Apart Fill Objects") ]] }, float = true })
hl.window_rule({ match = { class = "^(title:ripdrag)" }, size = { 600, 360 } })
hl.window_rule({ match = { class = "^(discord)" }, workspace = "9 silent" })
hl.window_rule({ match = { title = "^(Grayjay)$" }, idle_inhibit = "always" })

hl.window_rule({
	name = "ffxiv",
	match = {
		title = "^(FINAL FANTASY XIV)$",
	},
	idle_inhibit = "always",
	workspace = "6",
})

hl.window_rule({
	name = "immerse",
	match = {
		class = "^(immerse gamepack final fantasy xiv edition.exe)",
	},
	float = true,
	workspace = "special silent",
})

hl.window_rule({
	name = "explorer",
	match = {
		class = "^(explorer.exe)",
	},
	float = true,
	workspace = "special silent",
})

hl.window_rule({
	name = "steam",
	match = {
		class = "^(steam)$",
		title = "^(Steam Big Picture Mode)$",
	},
	fullscreen = true,
})

hl.window_rule({
	name = "gamescope",
	match = {
		class = "^(gamescope)",
	},
	fullscreen = true,
	no_blur = true,
})

hl.window_rule({
	name = "plexamp",
	match = {
		class = "^(plexamp)",
	},
	float = true,
	move = { 1500, 580 },
	size = { 400, 600 },
})

hl.window_rule({
	name = "finamp",
	match = {
		class = "finamp",
	},
	float = true,
	move = { 1500, 580 },
	size = { 400, 600 },
})

hl.window_rule({
	name = "kcalc",
	match = {
		class = "^(org.kde.kcalc)",
	},
	float = true,
	size = { 400, 600 },
})

hl.window_rule({
	name = "wine-system-tray",
	match = {
		title = "^(Wine System Tray)$",
	},
	float = true,
	move = { 1518, 478 },
	workspace = "special silent",
})

hl.window_rule({
	name = "mascot",
	match = {
		class = "com-group_finity-mascot-Main",
	},
	float = true,
	no_blur = true,
	no_focus = true,
	no_shadow = true,
	border_size = 0,
})

hl.window_rule({
	name = "rhythm-doctor-dance",
	match = {
		class = "^(steam_app_1920960)$",
		title = "^(MainWindow)$",
	},
	float = true,
	pin = true,
	no_anim = true,
	no_blur = true,
	no_shadow = true,
	border_size = 0,
})

hl.window_rule({
	name = "firefox-pip",
	match = {
		class = "^$",
		title = "^(Picture in picture)$",
	},
	float = true,
	pin = true,
})

hl.window_rule({
	name = "reaper",
	match = {
		class = "^(REAPER)$",
		title = "^(menu)$",
	},
	no_anim = true,
	move = { 0, 0 },
})
