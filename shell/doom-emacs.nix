{ config, pkgs, lib, ... }:
{
  # Install Doom Emacs from here: https://github.com/hlissner/doom-emacs

  # Doom configuration
  home.file.".doom.d/".source = ./doom-emacs;

  # Run Doom Sync when configuration changes or install Doom Emacs if it
  # doesn't exists.
  home.file.".doom.d/".onChange = ''
    if [[ ! -f "$HOME/.emacs.d/bin/doom" ]]
    then
      git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d
      $HOME/.emacs.d/bin/doom install
    fi
    $HOME/.emacs.d/bin/doom sync
  '';

  services.emacs.enable = true;

  # Doom Emacs requirements
  home.packages = with pkgs; [
    clang
    emacs
    fd
    ripgrep
  ];
}
