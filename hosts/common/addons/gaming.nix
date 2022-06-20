{ config, pkgs, lib, ... }: {
  #hax for steam to launch
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [
      libva
      pipewire
    ];
    setLdLibraryPath = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      rocm-runtime
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    steam-run
    desmume
  ];
}
