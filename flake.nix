{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

   # neovim-nightly-overlay = {
   #   url = "github:nix-community/neovim-nightly-overlay";
   #   inputs.nixpkgs.follows = "nixpkgs";
   # };
  };

  outputs = {nixpkgs, home-manager, ... }:
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
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
