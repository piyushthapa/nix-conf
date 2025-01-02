[
  {
    key = "<C-o>";
    action = "<Cmd>NvimTreeToggle<CR>";
    options.silent = true;
  }

  {
    key = "<space>e";
    action = "<Cmd>:lua vim.diagnostic.open_float(0, {scope='line'})<CR>";
    options.silent = true;
  }

  {
    key = "<tab>";
    mode = "n";
    action = "<CMD>:tabNext<CR>";
    options.silent = true;
  }

]
