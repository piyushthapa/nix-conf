augroup elixir 
	autocmd FileType elixir set colorcolumn=98
	autocmd FileType elixir set expandtab
	autocmd FileType elixir set tabstop=2
	autocmd FileType elixir set softtabstop=2
	autocmd FileType elixir set shiftwidth=2
	
augroup END

let g:mix_format_on_save = 1
let g:neomake_elixir_enabled_makers = ['credo']
