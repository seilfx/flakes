{ ... }:

{
	programs.git.enable = true;

	programs.git.extraConfig = {
		init.defaultBranch = "main";

		user.name = "seil";
		user.email = "seil@seil.zip";
	};
}
