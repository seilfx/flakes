{ inputs, pkgs, ... }:

{
	services.xserver.enable = true;

	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;

		settings = {
			Wayland.Session = "niri";
		};
	};

	programs.niri.enable = true;

	environment.systemPackages = [
		inputs.swww.packages.${pkgs.system}.swww
	];

	fonts.packages = with pkgs; [
		inter
	];
}
