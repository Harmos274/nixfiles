{ config, pkgs, lib, ... }:
{
  imports = [
    # ./doom-emacs.nix
    ./neovim.nix
    ./kitty.nix
    ./fish.nix
  ];

  programs = { };
}
