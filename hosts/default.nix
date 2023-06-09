{ lib, inputs, nixpkgs, home-manager, hyprland, user, location, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit user inputs location;
      host = {
        hostName = "IdeaPad";
      };
    };
    modules = [
      inputs.hyprland.nixosModules.default
      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit user;
            host.hostName = "IdeaPad";
          };
          users.${user} = {
            imports = [ ./laptop/home.nix ];
          };
        };
      }
    ];
  };
}
