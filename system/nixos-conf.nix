{lib, inputs, system, ...}:
{
  nixos = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      ./machine/dell-xps15
    ];
  };
}
