{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
    #hyprlock.url = "github:hyprwm/Hyprlock";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-13.6.9" ];
        };

        overlays = [ ];
      };

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;

          modules = [ ./system/configuration.nix ];
        };
      };

      hm = {
        piyush = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [
            ./home/default.nix
            inputs.nixvim.homeManagerModules.nixvim
            {
              home = {
                sessionVariables = { NIXOS_OZONE_WL = "1"; };
                username = "piyush";
                homeDirectory = "/home/piyush";
                stateVersion = "24.11";
              };
            }
          ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
