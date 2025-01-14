{
	description = "System NixOS Flake -- seil";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		niri.url = "github:sodiboo/niri-flake";

		swww.url = "github:LGFae/swww";
	};

	outputs = {
		nixpkgs,
		home-manager,
		niri,
		swww,
		...
	}@inputs: let
		user = "seil";
	in {
		nixosConfigurations.seilwave = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {
				inherit inputs;
				inherit user;
			};

			modules = [
				./hosts/seilwave
				./sharedgui.nix

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;

					home-manager.extraSpecialArgs = {
						inherit inputs;
						inherit user;
					};

					home-manager.users.${user} = import ./home;
				}
			];
		};
	};
}
