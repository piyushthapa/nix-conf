{
  enable = true;
  autoEnableSources = true;
  settings.sources = [
    {
      name = "nvim_lsp";
      option = { max_item_count = 15; };
    }
    { name = "luasnip"; }
    { name = "path"; }
    {
      name = "buffer";
      keyword_length = 5;
    }
  ];

}
