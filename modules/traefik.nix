{ self, config, pkgs, lib, inputs, ... }:

{

	services.traefik = {
		
		enable = true;

		staticConfigOptions = {
			entryPoints = {
				web = {
					address = ":80";
					asDefault = true;
					http.redirections.entrypoint = {
						to = "websecure";
						scheme = "https";
					};
				};
				websecure = {
					address = ":443";
					asDefault = true;
				};
			};
		}

	};

}
