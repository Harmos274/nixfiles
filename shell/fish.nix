{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      # Set lsd as default ls and tree
      ls = "lsd";
      lr = "ls -R";
      llr = "ls -lR";
      tree = "ls --tree";

      v = "$EDITOR";
      hm = "$EDITOR $HOME/.config/nixpkgs";
      chm = "cd $HOME/.config/nixpkgs";
      gst = "git status";
      "..." = "cd ../../";
    };
  };
}
