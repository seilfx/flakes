{ config, lib, pkgs, user, ... }:

let
	hostname = "seilwave";
in
{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
		};

		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
	};

	networking = {
		hostName = "${hostname}";
		networkmanager.enable = true;
	};

	time.timeZone = "Europe/Stockholm";

	programs.zsh.enable = true;
	users.users.${user} = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "wheel" "networkmanager" ];
	};

	services.xserver.videoDrivers = [ "vmware" ];
	virtualisation.vmware.guest.enable = true;

	environment.systemPackages = with pkgs; [
		git
		vim
		wget
	];

	environment.variables.EDITOR = "vim";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "24.11";
}

