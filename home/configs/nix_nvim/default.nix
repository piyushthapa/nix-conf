{ pkgs, ... }:

let
  pluginSettings = import ./plugins;
  options = import ./options.nix;

in {
  enable = true;
  defaultEditor = true;
  plugins = pluginSettings;
  colorschemes.gruvbox.enable = true;
  opts = options;

}
