# Nix OS / Home Manager

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

