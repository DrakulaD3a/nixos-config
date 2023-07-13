{ imports, lib, pkgs, inputs, user, ... }:

{
  # Creating user
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "kvm" "libvirtd" "uucp" "docker" ];
    shell = pkgs.zsh;
  };

  time.timeZone = "Europe/Prague";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # Extra locale settings, that will overwrite the defaults
    extraLocaleSettings = {
      LC_TIME = "cs_CZ.UTF-8";
      LC_MONETARY = "cs_CZ.UTF-8";
    };
  };

  # Setting default font for tty
  console.font = "Lat2-Terminus16";

  # Installing my preffered font
  fonts.fonts = with pkgs; [
    font-awesome
    (nerdfonts.override {
      fonts = [ "Hack" ];
    })
  ];

  environment = {
    # Environment variables
    variables = {
      TERMINAL = "foot";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    # Default packages installed system-wide
    systemPackages = with pkgs; [
      vim
      wget
      curl
      pciutils
      bintools
    ];
    pathsToLink = [ "/share/zsh" ];
  };

  services = {
    # Sound server
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    # Autologin to shell
    getty.autologinUser = "${user}";
  };

  # Configuring nix package manager
  nix = {
    # Optimise syslinks
    settings.auto-optimise-store = true;
    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
    };
    # Enable flakes
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs	    = true
      keep-derivations	    = true
    '';
  };
  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
