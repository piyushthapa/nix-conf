{
  enable = true;
  settings = {

    # +-------------------------------------------------+
    # | A | B | C                             X | Y | Z |
    # +-------------------------------------------------+

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "fileformat" ];
      lualine_y = [ "filetype" ];
      lualine_z = [ "location" ];
    };

    options = {
      icons_enabled = true;
      theme = "gruvbox";
      extensions = [ "fzf" "quickfix" ];
      section_separators = {
        left = "";
        right = "";
      };

      component_separators = {
        left = "";
        right = "";
      };

    };
  };
}
