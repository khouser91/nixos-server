{ self, config, pkgs, lib, inputs, ... }:

{
	networking.firewall.allowedTCPPorts = [ 80 443 ];

	services.caddy = {
		enable = true;
		virtualHosts."localhost".extraConfig = ''
			respond "Hello, world!"
		'';

		virtualHosts."http://jellyfin.houser.casa".extraConfig = ''
			reverse_proxy http://10.0.1.40:8096
		'';

		virtualHosts."http://radarr.houser.casa".extraConfig = ''
			reverse_proxy http://10.0.1.20:7878
		'';

		virtualHosts."http://sonarr.houser.casa".extraConfig = ''
			reverse_proxy http://10.0.1.20:8989
		'';

		virtualHosts."http://qbit.houser.casa".extraConfig = ''
			reverse_proxy http://10.0.1.20:8080
		'';

		virtualHosts."http://prowlarr.houser.casa".extraConfig = ''
			reverse_proxy http://10.0.1.20:9696
		'';
		
		globalConfig = ''
			auto_https off
		'';
	};
}
