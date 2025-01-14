{ ... }:

{
	programs.foot = {
		enable = true;

		settings = {
			main = {
				term = "xterm-256color";
				dpi-aware = "yes";
			};

			mouse = {
				hide-when-typing = "yes";
			};

			cursor = {
				style = "underline";
				blink = "yes";
			};
		};
	};
}
