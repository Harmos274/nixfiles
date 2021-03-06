# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];

  # Enble VFIO for hardware acceleration on virtualized devices, v4l2loopback for streaming
  boot.kernelModules = [ "kvm-intel" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" "v4l2loopback" ];

  # Enable V4L2loopback for streaming
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback.out ];

  boot.kernelParams = [ "intel_iommu=on" ];

  # Enable KVM / QEmu backend and setup V4l2loopback for streaming
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 card_label="V4L2 Virtual Camera"
    options kvm_intel nested=1 vfio-pci ids=8086:5917
  '';

  fileSystems."/" =
    {
      device = "/dev/nvme0n1p3";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/39D1-56DA";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/43486f6f-9811-4309-9f76-b59a38bd3918"; }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
