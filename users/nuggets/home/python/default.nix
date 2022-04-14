{ config, pkgs, lib, ... }:
let
  packages = python-packages: with python-packages; [ pyyaml ];
  python-packages = pkgs.python3.withPackages packages;
in
{
  home.packages = with pkgs; [
    python-packages
  ];
}
