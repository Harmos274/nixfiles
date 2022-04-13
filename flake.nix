{
  description = "Harmos' NixOS configuation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs:
    let
      overlays = with inputs; [ neovim-nightly-overlay.overlay ];
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
    };
}
