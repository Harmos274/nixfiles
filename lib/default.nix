{ inputs }:
{
  mkSystem = { hosname, system, users ? [ ] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs system hostname;
      };
      modules = builtins.attrValues [
        ../hosts/${hostname}
        {
          networking.hostname = hostname;

          # Allow unfree packages
          nixpkgs.allowUnfree = true;

          # Add each input as a registry
          nix.registry = inputs.nixpkgs.lib.mapAttrs'
            (n: v: inputs.nixpkgs.lib.nameValuePair n { flake = v; })
            inputs;
        }
      ] ++ inputs.nixpkgs.lib.forEach users (u: ../users/${u}/system);
    };

  mkHome = { username, system, hostname }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit username system;
      extraSpecialArgs = {
        inherit system hostname persistence graphical trusted;
      };
      homeDirectory = "/home/${username}";
      configuation = ../users/${username}/home;
      extraModules = [
        {
          nixpkgs = {
            config.allowUnfree = true;
          };
          programs = {
            home-manager.enable = true;
            git.enable = true;
          };
          # ???
          systemd.user.startServices = "sd-switch";
        }
      ];
    };
}
