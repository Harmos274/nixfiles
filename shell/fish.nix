{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      # Set lsd as default ls
      ls = "lsd";
      tree = "ls --tree";
      v = "$EDITOR";
      hm = "$EDITOR $HOME/.config/nixpkgs";
      gst = "git status";
      "..." = "cd ../../";
    };
  };
}
