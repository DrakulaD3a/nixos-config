{ pkgs, lib, user, ... }:

{
  imports = [(import ./hardware-configuration.nix)] ++
	    [(import ../../modules/hyprland)];
  
  # Boot options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # Selecting the bootloader
    loader = {
      systemd-boot = {
	enable = true;
	# Limit the number of stored configurations
	configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };
  };

  # Enable OpenGL
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ intel-media-driver intel-ocl vaapiIntel ];
    };
    bluetooth.enable = true;
  };

  environment = {
    # Specific packages only for this host installed system-wide
    systemPackages = with pkgs; [
    ];
  };

  # Enable bluetooth
  services.blueman.enable = true;

  # Enable backlight control
  programs.light.enable = true;
}
