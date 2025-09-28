{ self, config, pkgs, lib, inputs, ... }:

{
	networking.firewall.allowedTCPPorts = [ 80 443 ];

	services.caddy = {
		enable = true;
		virtualHosts."localhost".extraConfig = ''
			respond "Hello, world!"
		'';

		virtualHosts."jellyfin.houser.casa".extraConfig = ''
			reverse_proxy 10.0.1.40:8096
		'';

		virtualHosts."radarr.houser.casa".extraConfig = ''
			reverse_proxy 10.0.1.20:7878
		'';

		virtualHosts."sonarr.houser.casa".extraConfig = ''
			reverse_proxy 10.0.1.20:8989
		'';

		virtualHosts."qbit.houser.casa".extraConfig = ''
			reverse_proxy 10.0.1.20:8080
		'';

		virtualHosts."prowlarr.houser.casa".extraConfig = ''
			reverse_proxy 10.0.1.20:9696
		'';
		
		extraConfig = ''
			auto_https: disable_certs
		'';
	};
}
