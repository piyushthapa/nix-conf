{config, pkgs, ...}:

{
  enable = true;
  settings = {
    font_size = "12.0";
    font_family = "DroidSansMono Nerd Font Mono";
    bold_font = "auto";
    italic_font = "auto";
    bold_italic_font = "auto";
    background = "#1d2021";
    selection_background="#a89984";
    foreground = "#83a598";
    selection_foreground="#282828";
    cursor="#8ec07c";


    color0  = "#002731";
    color1  = "#d01b24";
    color2  = "#728905";
    color3  = "#a57705";
    color4  = "#2075c7";
    color5  = "#c61b6e";
    color6  = "#259185";
    color7  = "#e9e2cb";
    color8  = "#001e26";
    color9  = "#bd3612";
    color10 = "#465a61";
    color11 = "#52676f";
    color12 = "#708183";
    color13 = "#5856b9";
    color14 = "#81908f";
    color15 = "#fcf4dc";

  };

  keybindings = {
    "ctrl+shift+enter" = "new_window_with_cwd";
  };
}
