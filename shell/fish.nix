{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      # Set lsd as default ls
      ls = "lsd";

      hm = "$EDITOR $HOME/.config/nixpkgs";

      gst = "git status";
    };
  };
}
