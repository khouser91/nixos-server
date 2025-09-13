{ self, config, pkgs, lib, inputs, ... }:

{
    	imports = [
   	];

    	# Enable Nix Helper
    	programs.nh = {
        	enable = true;
        	clean.enable = true;
		clean.extraArgs = "--keep-since 7d --keep 3";
		flake = "/home/kevin/nixos-config";
	};

    	# Enable the Flakes feature and the accompanying new nix command-line tool
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    	programs.git = {
		enable = true;
		config = {
			init = {
				defaultBranch = "main";
			};
		};
	};
}
