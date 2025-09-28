{ self, config, pkgs, lib, inputs, ... }:

{
	virtualisation.docker.enable = true;

	users.users.kevin.extraGroups = [ "docker" ];
}
