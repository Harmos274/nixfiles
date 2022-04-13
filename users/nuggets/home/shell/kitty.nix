{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${lib.strings.fileContents ./kitty/kitty.conf}
    '';
  };
}
