{
  description = "System config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:

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
	      stateVersion = "22.05";
	     };
	   }
	 ];
      };
    };
  };
}
