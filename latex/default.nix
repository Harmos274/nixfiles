{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    pandoc
    tectonic
  ];
}
