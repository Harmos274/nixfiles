# Nix OS / Home Manager

- DE: Gnome 4X
- Terminal Emulator: Kitty / Foot
- Shell: Fish
- Editor: Neovim (nightly)

You may have noted that i barely use the power of nix configs. There is two major reasons behind that, firstly 
i am very new in the nix/os world. Secondly, i also **need** to be able to use my configurations outside of a 
nix environment therefore i have to use a maximum amount of raw config files.

## Requirement

This is a **NixOS** configuration and i haven't tested it outside. Nix flakes and home-manager are required.
Since home-manager is OS agnostic, it may works outside of NixOS.

## flake.nix
After you cloned that repository anywere in your system, run the following commands to load the system and user
configurations.

```sh
$> sudo nixos-rebuild switch --flake .
$> home-manager switch --flake .
```
