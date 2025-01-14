{ ... }:

{
	programs.waybar.enable = true;

	programs.waybar.settings.mainBar = {
		layer = "top";
		position = "top";

		height = 32;
		margin-top = 4;

		modules-left = [ "niri/workspaces" ];
		modules-center = [ "niri/window" ];

		"niri/workspaces" = {
			all-outputs = true;
		};

		"niri/window" = {
			format = "{title}";
		};
	};

	programs.waybar.style = ''
		* {
			border: none;
			border-radius: 0;
			font-family: Inter, sans-serif;
			font-weight: 400;
			font-size: 14px;
		}

		window#waybar {
			background: #151515;
			color: #fff;
		}

		#workspaces button {
			padding: 0 4px;
		}
	'';
}
