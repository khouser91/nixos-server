{ self, config, pkgs, lib, inputs, ... }:

{
    # Enable samba
    services.samba = {
        enable = true;
    };

    # Open ports for NFS
    networking.firewall = {
      # for NFSv3; view with `rpcinfo -p`
      allowedTCPPorts = [ 111 2049 4000 4001 4002 20048 ];
      allowedUDPPorts = [ 111 2049 4000 4001 4002 20048 ];
    };

}
