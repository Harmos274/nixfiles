{
  description = "Harmos' NixOS configuation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      lib = import ./lib { inherit inputs; };
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
