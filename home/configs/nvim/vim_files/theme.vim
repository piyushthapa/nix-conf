set termguicolors
colorscheme gruvbox
set background=dark
let g:one_allow_italics = 1

"LightLine Themes
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'


" Add git branch name to light line
let g:lightline = {
  \'active': {
    \'left': [ [ 'mode', 'paste' ],
      \[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \},
  \'component_function': {
      \'gitbranch': 'FugitiveHead'
    \},
 \}
