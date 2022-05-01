# Nvim configuration

{pkgs, config, ... }:

{
        enable = true;
	extraConfig = builtins.readFile ./init.vim;
	plugins = with pkgs.vimPlugins; [
		gruvbox-nvim 
		nvim-treesitter
                fzf-vim

                # Languages
                vim-elixir
                vim-nix


                # cmp related packages
                nvim-cmp
                cmp-nvim-lsp
                cmp-path
                cmp-buffer
                nvim-lspconfig

	];
}

