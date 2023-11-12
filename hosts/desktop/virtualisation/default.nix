{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "samuelb" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
