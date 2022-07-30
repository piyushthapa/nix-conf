{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, home-manager, neovim-nightly-overlay, ... }:

  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { 
      	allowUnfree = true; 
	permittedInsecurePackages = [
          "electron-13.6.9"
        ];
      };
      overlays = [
        neovim-nightly-overlay.overlay
      ];

    };

    lib = nixpkgs.lib;

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
  
        modules = [
          ./system/configuration.nix
        ];
      };
    };

    
    hm = {
       piyush = home-manager.lib.homeManagerConfiguration {
         inherit system pkgs;
	 username = "piyush";
         homeDirectory = "/home/piyush";
         configuration = {
	   imports = [./home];
         };
      };
    };
  };
}
