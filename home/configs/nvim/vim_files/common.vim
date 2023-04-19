set number relativenumber
syntax enable
filetype plugin indent on

" disable arrow key in Normal Mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Setup keys for tabs
nmap tt :tabnew <CR>

autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
