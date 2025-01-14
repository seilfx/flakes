{ inputs, config, pkgs, user, ... }:

{
	imports = [
		./bemenu
		./foot
		./git
		./niri
		./waybar
		./zsh
	];

	home = {
		username = "${user}";
		homeDirectory = "/home/${user}";
		stateVersion = "24.11";
	};

	home.packages = with pkgs; [
		nnn
		unzip

		firefox
	];

	programs.home-manager.enable = true;
}
