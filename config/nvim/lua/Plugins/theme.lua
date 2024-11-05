require("gitsigns").setup {
  signs = {
    add          = { text = ' |' },
    change       = { text = '|' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
}

require("lualine").setup {
  options = {
    component_separators = { left = '', right = '' },
    extensions = { "fzf", "quickfix" },
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    theme = "gruvbox",
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'fileformat' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
}

require("gruvbox").setup({
  overrides = {
    SignColumn = { link = "Normal" },
    GruvboxGreenSign = { bg = "" },
    GruvboxOrangeSign = { bg = "" },
    GruvboxPurpleSign = { bg = "" },
    GruvboxYellowSign = { bg = "" },
    GruvboxRedSign = { bg = "" },
    GruvboxBlueSign = { bg = "" },
    GruvboxAquaSign = { bg = "" },
  },
})

vim.o.background = "dark"
vim.cmd.colorscheme "gruvbox"
