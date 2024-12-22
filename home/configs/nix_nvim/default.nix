{ pkgs, ... }:

let
  pluginSettings = import ./plugins;
  options = import ./options.nix;
  keymaps = import ./keymap.nix;

in {
  enable = true;

  defaultEditor = true;

  plugins = pluginSettings;

  colorschemes.gruvbox = {
    enable = true;
    settings = {
      terminal_colors = true;
      overrides = {
        SignColumn = { link = "Normal"; };
        GruvboxGreenSign = { bg = ""; };
        GruvboxOrangeSign = { bg = ""; };
        GruvboxPurpleSign = { bg = ""; };
        GruvboxYellowSign = { bg = ""; };
        GruvboxRedSign = { bg = ""; };
        GruvboxBlueSign = { bg = ""; };
        GruvboxAquaSign = { bg = ""; };
      };
    };
  };

  opts = options;

  keymaps = keymaps;

  globals = { mapleader = " "; };

  extraConfigLua = builtins.readFile ./init.lua;

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "aiken-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "aiken-lang";
        repo = "editor-integration-nvim";
        rev = "a816a1f171a5d53c9e5dcba6f6823f5d5e51d559";
        hash = "sha256-v6/6oAPOgvMHpULDSyN1KzOf33q92Wri2BcqcuHGJzI=";
      };
    })

  ];
}
