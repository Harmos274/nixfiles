{ config, pkgs, lib, ... }: {
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclude base gnome packages
  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-remote-desktop
    epiphany
    geary
  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];
}
