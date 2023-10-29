{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
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
       	 pkgs = pkgs;
	 modules = [
	   ./home/default.nix
	   {
	     home = {
	      username = "piyush";
              homeDirectory = "/home/piyush";
	      stateVersion = "23.05";
	     };
	   }
	 ];
      };
    };
  };
}
