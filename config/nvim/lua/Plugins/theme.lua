local catppuccin = require 'catppuccin'
local colorizer = require 'colorizer'
local gitsigns = require 'gitsigns'
local lualine = require 'lualine'

catppuccin.setup({
	flavour = "macchiato",
        integrations = {
            gitsigns = true,
            --indent_blankline = { enabled = true },
            native_lsp = {
                enabled = true,
            },
            telescope = true,
            treesitter = true,
        },
        term_colors = true,
        transparent_background = true,
    })

    colorizer.setup {}

    gitsigns.setup {}

    lualine.setup {
        options = {
            component_separators = { left = '', right = '' },
            extensions = { "fzf", "quickfix" },
            icons_enabled = false,
            section_separators = { left = '', right = '' },
            theme = "catppuccin"
        },
    }


-- kanagawa Theme setup
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
});


vim.cmd.colorscheme "kanagawa"
