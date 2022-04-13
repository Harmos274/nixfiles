{ config, pkgs, lib, ... }: {
  #hax for steam to launch
  hardware.opengl = {
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva pipewire ];
    setLdLibraryPath = true;
    #package = unstable.mesa.drivers;
    extraPackages = with pkgs; [ rocm-opencl-icd rocm-opencl-runtime rocm-runtime ];
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    steam-run
    desmume
  ];
}
