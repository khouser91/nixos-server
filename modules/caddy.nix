{ self, config, pkgs, lib, inputs, ... }:

{
	services.caddy = {
		enable = true;
		virtualHosts."localhost".extraConfig = ''
			respond "Hello, world!"
		'';
	};
}
