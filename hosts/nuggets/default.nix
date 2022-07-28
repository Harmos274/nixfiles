{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common/dewm/sway.nix # Include this for a lighter DE
    # ../common/dewm/kdeplasma.nix # Include this for fucking plasma desktop
    ../common/dewm/gnome.nix # Include this for Gnome (the best of all)
    ../common/addons/gaming.nix # Lutris, Steam etc... for G4MING
    ../common/addons/flatpak.nix # enable Flatpak and Flatpak builder
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking.hostName = "nuggets"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "fr";
  # services.xserver.xkbOptions = "eurosign:e";

  # Use same config for linux console
  console.useXkbConfig = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Prevent Spotify from muting when another audio source is running
  hardware.pulseaudio.extraConfig = "unload-module module-role-cork";

  # Enable rtkit deamon
  security.rtkit.enable = true;

  # Enable pipewire backend
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # No idea if I need this
    alsa.support32Bit = true;
    pulse.enable = true;
    config.pipewire = {
      "context.properties" = {
        default.clock.allowed-rates = [ 44100 48000 ];
      };
    };
    #config.pipewire = {
    #  "context.properties" = {
    #    "link.max-buffers" = 16;
    #    "log.level" = 2;
    #    "default.clock.rate" = 48000;
    #    "default.clock.quantum" = 32;
    #    "default.clock.min-quantum" = 32;
    #    "default.clock.max-quantum" = 32;
    #    "core.daemon" = true;
    #    "core.name" = "pipewire-0";
    #  };
    #  "context.modules" = [
    #    {
    #      name = "libpipewire-module-rtkit";
    #      args = {
    #        "nice.level" = -15;
    #        "rt.prio" = 88;
    #        "rt.time.soft" = 200000;
    #        "rt.time.hard" = 200000;
    #      };
    #      flags = [ "ifexists" "nofail" ];
    #    }
    #    { name = "libpipewire-module-protocol-native"; }
    #    { name = "libpipewire-module-profiler"; }
    #    { name = "libpipewire-module-metadata"; }
    #    { name = "libpipewire-module-spa-device-factory"; }
    #    { name = "libpipewire-module-spa-node-factory"; }
    #    { name = "libpipewire-module-client-node"; }
    #    { name = "libpipewire-module-client-device"; }
    #    {
    #      name = "libpipewire-module-portal";
    #      flags = [ "ifexists" "nofail" ];
    #    }
    #    {
    #      name = "libpipewire-module-access";
    #      args = { };
    #    }
    #    { name = "libpipewire-module-adapter"; }
    #    { name = "libpipewire-module-link-factory"; }
    #    { name = "libpipewire-module-session-manager"; }
    #  ];
    #};
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable fish
  programs.fish.enable = true;

  # Enable dconf editor
  programs.dconf.enable = true;

  # Enable Nix Flakes
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Optimize Nix Store storage consumption
  nix.autoOptimiseStore = true;

  # Run Nix garbage collector every week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    exfat
    firefox
    fish
    fuse
    gcc
    git
    gnumake
    htop
    ncdu
    neovim
    ntfs3g
    obsidian
    obs-studio
    python3
    spotify
    teams
    teamspeak_client
    thunderbird
    tree
    unlaggy-discord-canary
    virt-manager
    vivaldi
    vivaldi-ffmpeg-codecs
    #vivaldi-widevine
    wget
  ];

  nixpkgs.config.permittedInsecurePackages = [
    # For old electron app (Discord, VSCode etc.)
    "electron-13.6.9"
    "libdwarf-20181024"
  ];

  # Set Neovim as default editor
  environment.variables.EDITOR = "nvim";
  environment.variables.DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
    };
    kvmgt = {
      enable = true;
      vgpus = {
        "i915-GVTg_V5_4" = {
          uuid = [ "d506acc8-b8ee-11ec-a781-ff42d1c0b289" ];
        };
      };
    };
    docker.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 3000 5000 ];
  networking.firewall.allowedUDPPorts = [ 3000 5000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
