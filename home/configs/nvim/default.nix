{pkgs, config, ... }:

let 
  blamer = pkgs.vimUtils.buildVimPlugin {
    name = "blamer";
    src = pkgs.fetchFromGitHub {
      owner = "APZelos";
      repo = "blamer.nvim";
      rev = "v1.3.0";
      sha256 = "uIrbnoS2llGjn/mLMftO4F6gss0xnPCE39yICd0N51Y=";
    };
  };
in
{
        enable = true;
	extraConfig = builtins.readFile ./init.vim;
	plugins = with pkgs.vimPlugins; [
		gruvbox-nvim 
                vim-airline
		nvim-treesitter
                fzf-vim

                # git
                blamer

                # Languages
                vim-elixir
                haskell-vim
                vim-nix
                coc-nvim

                # cmp related packages
                nvim-cmp
                cmp-nvim-lsp
                lspkind-nvim
                cmp-path
                cmp-buffer
                nvim-lspconfig
	];
}
