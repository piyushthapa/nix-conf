local gitsigns = require 'gitsigns'

gitsigns.setup {}

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

vim.cmd.colorscheme "gruvbox"
