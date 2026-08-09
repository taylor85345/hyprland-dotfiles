#Environment Variables for the Hyprland session

--DISABLED FOR UWSM
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("GTK_CSD", "0")
hl.env("HYPRCURSOR_THEME", "HyprBibataModernClassicSVG")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("ENABLE_HDR_WSI", "1")
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/gcr/ssh")
hl.env("SSH_ASKPASS", "/usr/lib/seahorse/ssh-askpass")
hl.env("SSH_ASKPASS_REQUIRE", "prefer")

--hl.env("XCURSOR_SIZE", "24")
--hl.env("SDL_VIDEODRIVER", "wayland")
--hl.env("__GL_GSYNC_ALLOWED", "1")
--hl.env("__GL_VRR_ALLOWED", "1")
