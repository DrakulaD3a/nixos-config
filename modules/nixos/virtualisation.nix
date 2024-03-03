{ pkgs, ... }:

{
  environment.systemPackages = with pkgs;[
    qemu
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
