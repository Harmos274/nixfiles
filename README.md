# Nix OS / Home Manager

- DE: Gnome 40
- Terminal Emulator: Kitty
- Shell: Fish
- Editor: Nvim (nightly)

You may have noted that i barely use the power of nix configs. There is two major reasons behind that, firstly 
i am very new in the nix/os world. Secondly, i also want to use my configurations outside of a nix environment 
therefore i have to use a maximum amount of raw config files.

## Install
Nix and home-manager are required.

### Before install
```sh
$> git submodule update --init
```

### configuration.nix
You may need to `chown` `/etc/nixos/` before.

```sh
$> cd nixfiles
$> ln -sf $PWD/configuration.nix /etc/nixos/configuration.nix
$> sudo nixos-rebuild switch
```

### home.nix
```sh
$> cd nixfiles
$> home-manager switch
```

