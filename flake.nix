{
  description = "My personal NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, hyprland, ... }:
    let
      user = "lukas";
      location = "$HOME/.nixos";
      proj_root =
        let
          path = builtins.toString ./.;
        in
        {
          inherit path;
          configs.path = "${path}/native_configs";
        };
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib proj_root;
          inherit inputs user location nixpkgs home-manager hyprland;
        }
      );
    };
}
