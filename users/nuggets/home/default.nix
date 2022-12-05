{ config, pkgs, unstable-pkgs, ... }:
{
  imports = [
    ./python
    ./shell
    #./latex
    ./custom-fonts
  ];


  # Environment variables for Nuggets
  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    VISUAL = "nvim";
    DIFFPROG = "nvim -d";
    MANPAGER = "nvim +Man!";
    MANWIDTH = 999;
  };

  # Basic Git configuration
  programs.git = {
    enable = true;
    userName = "Lilian VERLHAC";
    userEmail = "lilian.verlhac@outlook.com";
    aliases = {
      puhs = "push";
    };
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only --features=interactive";
      delta = {
        features = "decoration";
        navigate = "true";
        side-by-side = "true";
        line-numbers = "false";
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  # enable font configuration
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "MPlus" "FiraCode" "FiraMono" "IBMPlexMono" ]; })
    cozette
    jetbrains-mono
    roboto
    roboto-slab
    overpass
    ibm-plex

    appimage-run
    azure-cli
    bat
    calibre
    cawbird
    delta
    deluge
    fzf
    inkscape
    jq
    lsd
    ncdu
    neofetch
    newsflash
    unstable-pkgs.nodejs
    pyright
    ripcord
    ripgrep
    rustup
    silver-searcher
    stack
    vlc
    vscode
    wpgtk
    yarn

    # JetBrains
    jetbrains.datagrip
    jetbrains.idea-ultimate
    jetbrains.webstorm
  ];
}

