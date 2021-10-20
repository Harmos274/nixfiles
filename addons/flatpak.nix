{ config, pkgs, lib, ... }: {
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    flatpak-builder
  ];
}
