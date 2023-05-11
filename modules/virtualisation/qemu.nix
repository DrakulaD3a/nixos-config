{ config, pkgs, user, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      virt-manager
    ];
  };

  virtualisation.libvirtd.enable = true;
  # user.groups.libvirtd.members = [ "${user}" ];
}
