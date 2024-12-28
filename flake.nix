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
      vars = {
        user = "arthurcoruble";
      };
    in
    {
      darwinConfigurations."MacbookProM1" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs nixpkgs nix-darwin home-manager vars; };
        modules = [
          ./nix-darwin
          home-manager.darwinModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.${vars.user} = import ./home-manager;
          }
        ];
      };
    };
}
