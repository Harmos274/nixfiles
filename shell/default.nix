{ config, pkgs, lib, ... }:
{
  imports = [
    ./fish.nix
    ./neovim.nix
    ./kitty.nix
  ];

  programs = {
    lsd.enable = true;

    bat.enable = true;
  };
}
