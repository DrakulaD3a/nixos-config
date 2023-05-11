{ config, pkgs, user, ... }:

{
  virtualisation.docker.enable = true;
  # user.groups.docker.members = [ "${user}" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
