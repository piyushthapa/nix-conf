{
  enable = true;
  settings = {
    background = {
      monitor = "";
      "color" = "rgba(25, 20, 20, 1.0)";

      # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
      blur_passes = 0;
      blur_size = 7;
      noise = 1.17e-2;
      contrast = 0.8916;
      brightness = 0.8172;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
    };

    input-field = [{
      monitor = "";
      size = "300, 50";
      position = "0, -80";
      dots_center = true;
      fade_on_empty = false;
      font_color = "rgb(202, 211, 245)";
      inner_color = "rgb(91, 96, 120)";
      outer_color = "rgb(24, 25, 38)";
      outline_thickness = 5;
      shadow_passes = 2;
    }];

  };
}
