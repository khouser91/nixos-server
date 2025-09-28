{ self, config, pkgs, lib, inputs, ... }:

{
	services.newt = {
		enable = true;
		endpoint = "https://pangolin.houser.casa";
		id = "tip4n96zov04j09";
		environmentFile = /home/kevin/newt/var.env;	
  	};

	networking.firewall.allowedUDPPorts = [
		51820
		21820
	];
}
