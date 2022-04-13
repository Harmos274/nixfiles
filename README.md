# Nix OS / Home Manager

- DE: Gnome 40
- Terminal Emulator: Kitty
- Shell: Fish
- Editor: Nvim (nightly)

You may have noted that i barely use the power of nix configs. There is two major reasons behind that, firstly 
i am very new in the nix/os world. Secondly, i also want to use my configurations outside of a nix environment 
therefore i have to use a maximum amount of raw config files.

## Install
Nix flake and home-manager are required.

### flake.nix
You may need to `chown` `/etc/nixos/` before.

```sh
$> cd nixfiles
$> ln -sf $PWD/flake.nix /etc/nixos/flake.nix
$> sudo nixos-rebuild switch --flake .
$> home-manager switch --flake .
```
