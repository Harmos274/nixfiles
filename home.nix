{ config, pkgs, ... }:

{
  # Nix overlays
  nixpkgs.overlays = [
    (
      import (
        builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
        }
      )
    )
  ];

  imports = [
    ./python
    ./shell
    ./latex
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Environment variables for Nuggets
  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    VISUAL = "nvim";
    DIFFPROG = "nvim -d";
    MANPAGER = "nvim +Man!";
    MANWIDTH = 999;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nuggets";
  home.homeDirectory = "/home/nuggets";

  # Basic Git configuration

  programs.git = {
    enable = true;
    userName = "Lilian VERLHAC";
    userEmail = "lilian.verlhac@outlook.com";
  };


  # enable font configuration
  fonts.fontconfig.enable = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "MPlus" "FiraCode" "FiraMono" "IBMPlexMono" ]; })
    cozette
    jetbrains-mono
    overpass

    ag
    appimage-run
    azure-cli
    bat
    deluge
    fzf
    inkscape
    jq
    lsd
    minecraft
    neofetch
    ncdu
    newsflash
    nodejs_latest
    postman
    pyright
    ripcord
    ripgrep
    rustup
    stack
    vlc
    vscode
    wpgtk
    yarn

    # JetBrains
    android-studio
    jetbrains.datagrip
    jetbrains.webstorm
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
