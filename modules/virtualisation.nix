{ config, pkgs, user, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        verbatimConfig = ''
          nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
        '';
      };
    };
    docker.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      qemu_full
      virt-manager
      OVMF
      docker
    ];
  };

  user.groups = {
    libvirtd.members = [ "${user}" ];
    docker.members = [ "${user}" ];
  };
}
