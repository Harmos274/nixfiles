{config, pkgs, lib, ...}:
{
  imports = [
    ./fish.nix
    ./neovim.nix
  ];
  
  programs = {
    lsd.enable = true;
  
    bat.enable = true;


  };
}
