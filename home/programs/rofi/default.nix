{pkgs, ...}:

{
  enable = true;
  theme = ./theme.rafi;
  terminal = "${pkgs.kitty}/bin/kitty";
}

