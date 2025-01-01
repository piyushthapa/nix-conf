# overlays/waybar.nix
# overlays/waybar.nix
final: prev: {
  waybar = (prev.waybar.override { swaySupport = false; }).overrideAttrs
    (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags
        ++ [ "-Dexperimental=true" "-Dwrap_mode=nofallback" ];
    });
}
