{ self, config, pkgs, lib, inputs, ... }:

{
	networking.firewall.allowedTCPPorts = [ 80 443 ];

	services.caddy = {
		enable = true;
		virtualHosts."localhost".extraConfig = ''
			respond "Hello, world!"
		'';

		virtualHosts."jellyfin.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.40:8096
		'';

		virtualHosts."radarr.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.20:7878
		'';

		virtualHosts."sonarr.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.20:8989
		'';

		virtualHosts."qbit.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.20:8080
		'';

		virtualHosts."prowlarr.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.20:9696
		'';

		virtualHosts."hass.houserkaser.local".extraConfig = ''
			reverse_proxy 10.0.1.10:8123
		'';
	};
}
