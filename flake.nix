{
	description = "server appliance flake";
	inputs = {
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
   	 	nixos-hardware.url = "github:NixOS/nixos-hardware/master";
		authentik-nix = {
    			url = "github:nix-community/authentik-nix";
    			inputs.nixpkgs.follows = "nixpkgs";
  		};

	};

	outputs = {
   		self,
    		nixpkgs-stable,
    		nixpkgs,
		nixos-hardware,
		...
	}@inputs: {
		nixosConfigurations = {
			desktop-server = nixpkgs.lib.nixosSystem rec {
        			system = "x86_64-linux";
        			specialArgs = {
          				pkgs-stable = import nixpkgs-stable {
            					inherit system;
            					config.allowUnfree = true;
          				};
          				inherit inputs;
				};
				modules = [
					./hosts/desktop-server/configuration.nix
					nixos-hardware.nixosModules.common-cpu-amd
					nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
				];
			};
        	};
	};
}
