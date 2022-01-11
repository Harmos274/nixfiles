{ config, pkgs, lib, ... }:
let
  inherit (pkgs) callPackage fetchFromGitHub mkShell;
  easy-hls-src = fetchFromGitHub {
    owner = "jkachmar";
    repo = "easy-hls-nix";
    rev = "20451bf65497fe9f8a972671e9925bd41e7ee15e";
    sha256 = "Yd99o51HlzSYIKIMrYfdcumDyQ3Fz0S+r7G5PcCtXOM=";
  };
  easy-hls = callPackage easy-hls-src { };
in
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
      easy-hls
      nodePackages.typescript
      nodePackages.typescript-language-server
      rnix-lsp
      rust-analyzer
      sumneko-lua-language-server
      texlab
    ];
  };
}
