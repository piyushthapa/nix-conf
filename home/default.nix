{config, pkgs, ... }:

let 
  withLang = lang: builtins.elem lang config.language-support;
  vimsettings = import ./configs/nvim;
in
{
  imports = [
    ./packages.nix
    ./configs/language-support.nix
  ];

  programs.neovim = vimsettings pkgs;

  xdg.configFile."nvim/coc-settings.json".source = pkgs.writeTextFile {
    name = "coc-settings.json";
    text = builtins.readFile ./configs/nvim/coc-settings.json;
  };

  programs.tmux = {
    enable = true;
    clock24= true;
    newSession = true;
    extraConfig =  ''
      bind-key -n C-Tab next-window
    '';
  };
}
