{ config, pkgs, lib, ... }:
{
  # In order to make neovim work, you need to locally install:
  # - packer: (https://github.com/wbthomason/packer.nvim#quickstart)

  xdg.configFile."nvim/lua".source = ./nvim/lua;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = ''
      lua << EOF
      ${lib.strings.fileContents ./nvim/init.lua}
      EOF
    '';
    extraPackages = with pkgs; [
      tree-sitter

      # LSP
      rnix-lsp
      nodePackages.typescript
      nodePackages.typescript-language-server
      rust-analyzer
    ];
  };
}
