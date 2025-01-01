{
  enable = true;
  settings = {
    nerd_font_variant = "mono";
    signature = { enabled = true; };
    windows.documentation = {
      auto_show = true;
      auto_show_delay_ms = 500;
    };
    ghost_text = { enabled = true; };
    sources = {
      copilot = {
        async = true;
        module = "blink-cmp-copilot";
        name = "copilot";
        score_offset = 100;
      };

      default = [ "lsp" "path" "luasnip" "buffer" "copilot" ];
    };
  };
}
