{
  description = "Harmos' NixOS configuation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    let
      local-overlays = import ./overlays;
      overlays = with inputs;
        [
          local-overlays
        ];
      lib = import ./lib { inherit inputs overlays; };
    in
    {
      nixosConfigurations = {
        nuggets = lib.mkSystem {
          hostname = "nuggets";
          system = "x86_64-linux";
          users = [ "nuggets" ];
        };
      };
      homeConfigurations = {
        "nuggets@nuggets" = lib.mkHome {
          username = "nuggets";
          system = "x86_64-linux";
          hostname = "nuggets";
        };
      };

    } // inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import inputs.nixpkgs { inherit system overlays; };
        in
        {
          # If you're not using NixOS and only want to load your home
          # configuration when `nix` is installed on your system and
          # flakes are enabled.
          #
          # Enable a `nix develop` shell with home-manager and git to
          # only load your home configuration.
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [ home-manager git ];
            NIX_CONFIG = "experimental-features = nix-command flakes";
          };
        }
      );
}
