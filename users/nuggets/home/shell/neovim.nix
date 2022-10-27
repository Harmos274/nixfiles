{ config, pkgs, lib, ... }:
{
  # In order to make neovim work, you need to locally install:
  # - packer: (https://github.com/wbthomason/packer.nvim#quickstart)

  xdg.configFile."nvim/lua".source = ./nvim/lua;

  xdg.configFile."nvim/lua".onChange = ''
    echo ":: NEOVIM - Run Packer Sync"
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  '';

  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua << EOF
      ${lib.strings.fileContents ./nvim/init.lua}
      EOF
    '';
    extraPackages = with pkgs; [
      tree-sitter

      # LSP
      easy-hls
      hlint
      # easy-ps.purescript-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      rnix-lsp
      rust-analyzer
      sumneko-lua-language-server
      texlab
    ];
  };
}
