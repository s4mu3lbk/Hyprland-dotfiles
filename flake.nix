{
  description = "My flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        samuelb = lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit hyprland; };
          modules = [
            ./nixos/configuration.nix
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.samuelb = import ./home/home.nix;
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };
    };
}
