
{ inputs, config, pkgs, ... }:

{
	imports = [ inputs.niri.homeModules.niri ];
	nixpkgs.overlays = [ inputs.niri.overlays.niri ];

	programs.niri.enable = true;

	programs.niri.settings.debug = {
		render-drm-device = "/dev/dri/renderD128";
	};

	programs.niri.settings.spawn-at-startup = [
		{
			command = [ "${pkgs.swww}/bin/swww-daemon" ];
		}
		{
			command = [ "${pkgs.swww}/bin/swww" "img" "--transition-type" "wipe" "--transition-angle" "30" "/etc/nixos/wallpaper/wallpapers/1.jpg" ];
		}
		{
			command = [ "${pkgs.waybar}/bin/waybar" ];
		}
	];

	programs.niri.settings.prefer-no-csd = true;

	programs.niri.settings.cursor = {
		hide-when-typing = true;

		size = 12;
	};

	programs.niri.settings.layout = {
		gaps = 4;
		struts = {
			top = 0;
			right = 0;
			bottom = 0;
			left = 0;
		};

		always-center-single-column = true;
		empty-workspace-above-first = true;

		focus-ring = {
			enable = true;

			width = 1;

			active = {
				color = "rgba(255 255 255 0.4)";
			};
			inactive = {
				color = "rgba(255 255 255 0.8)";
			};
		};

		# default-column-width = {
		# 	proportion = 0.5;
		# };
	};

	programs.niri.settings.window-rules = [
		{
			clip-to-geometry = true;
			geometry-corner-radius = {
				top-left = 4.;
				top-right = 4.;
				bottom-right = 4.;
				bottom-left = 4.;
			};
		}
		{
			matches = [{ title = "foot"; }];
			open-maximized = true;
		}
	];

	programs.niri.settings.binds = with config.lib.niri.actions; {
		"Mod+Shift+Slash".action = show-hotkey-overlay;

		"Mod+Equal".action = set-column-width "+10%";
		"Mod+Minus".action = set-column-width "-10%";
		"Mod+Alt+Minus".action = set-column-width "50%";
		"Mod+Alt+F".action = maximize-column;

		"Mod+Shift+Equal".action = set-window-height "+10%";
		"Mod+Shift+Minus".action = set-window-height "-10%";
		"Mod+Shift+Alt+F".action = set-window-height "100%";

		"Mod+Ctrl+R".action = reset-window-height;
		
		"Mod+Shift+F".action = fullscreen-window;

		"Mod+Q".action = close-window;
		"Mod+Shift+E".action = quit;

		"Mod+Left".action = focus-column-left;
		"Mod+Right".action = focus-column-right;
		"Mod+Up".action = focus-window-up;
		"Mod+Down".action = focus-window-down;

		"Mod+H".action = focus-column-left;
		"Mod+J".action = focus-window-down;
		"Mod+K".action = focus-window-up;
		"Mod+L".action = focus-column-right;		

		"Mod+Ctrl+Left".action = move-column-left;
		"Mod+Ctrl+Right".action = move-column-right;
		"Mod+Ctrl+Up".action = move-window-up;
		"Mod+Ctrl+Down".action = move-window-down;

		"Mod+Ctrl+H".action = move-column-left;
		"Mod+Ctrl+J".action = move-window-down;
		"Mod+Ctrl+K".action = move-window-up;
		"Mod+Ctrl+L".action = move-column-right;		

		"Mod+1".action = focus-workspace 1;	
		"Mod+2".action = focus-workspace 2;	
		"Mod+3".action = focus-workspace 3;	
		"Mod+4".action = focus-workspace 4;	
		"Mod+5".action = focus-workspace 5;	
		"Mod+6".action = focus-workspace 6;	
		"Mod+7".action = focus-workspace 7;	
		"Mod+8".action = focus-workspace 8;	
		"Mod+9".action = focus-workspace 9;

		"Mod+Page_Down".action = focus-workspace-down;
		"Mod+Page_Up".action = focus-workspace-up;
		
		"Mod+Ctrl+1".action = move-column-to-workspace 1;	
		"Mod+Ctrl+2".action = move-column-to-workspace 2;	
		"Mod+Ctrl+3".action = move-column-to-workspace 3;	
		"Mod+Ctrl+4".action = move-column-to-workspace 4;	
		"Mod+Ctrl+5".action = move-column-to-workspace 5;	
		"Mod+Ctrl+6".action = move-column-to-workspace 6;	
		"Mod+Ctrl+7".action = move-column-to-workspace 7;	
		"Mod+Ctrl+8".action = move-column-to-workspace 8;	
		"Mod+Ctrl+9".action = move-column-to-workspace 9;	

		"Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
		"Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
		
		"Mod+Ctrl+U".action = move-column-to-workspace-down;
		"Mod+Ctrl+I".action = move-column-to-workspace-up;

		"Mod+D".action = spawn "bemenu";
		"Mod+F".action = spawn "firefox";
		"Mod+T".action = spawn "foot";
		
	};
}
