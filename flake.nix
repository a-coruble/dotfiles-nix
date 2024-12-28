{
  description = "Macbooks Configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nix-darwin, nixpkgs, home-manager }:
    let
      pkgs = import nixpkgs { system = "aarch64-darwin"; config.allowUnfree = true; };
    in
    {
      darwinConfigurations."MacbookProM1" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit self inputs pkgs nixpkgs nix-darwin home-manager; };
        modules = [
          ./nix-darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.arthurcoruble = import ./home-manager;
          }
        ];
      };
    };
}
