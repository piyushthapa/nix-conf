{ lib, ... }:

{
  options.language-support = lib.mkOption {
    default = [ ];
    type = lib.types.listOf
      (lib.types.enum [ "nix" "bash" "haskell" "elixir" "rust" ]);
    description = ''
      Which languages to install additional tools for.
      For programming languages, don't expect tools available on your $PATH,
      this is only about the text editor support.
    '';
  };
}
