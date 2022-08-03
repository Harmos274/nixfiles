{ config, pkgs, lib, ... }: {
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude base gnome packages
  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-remote-desktop
    #epiphany
    geary
    gnome-software
  ];

  environment.systemPackages = with pkgs; [
    #gnomeExtensions.pop-shell
    gnome.gnome-tweaks
    amberol
  ];
}
